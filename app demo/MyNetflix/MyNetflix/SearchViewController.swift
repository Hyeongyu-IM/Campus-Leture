//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/02.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import Kingfisher
import AVFoundation

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    // MVVM에서 벗어난것
    // 아래코드는 뷰컨트롤러가 모델을 갖는일이다 -> 원래는 뷰모델이 모델을 가져야함
    // 초반에는 검색한게 없으니까 빈 깡통!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 몇개의 셀
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 어떻게 표현할 꺼니?
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else { return UICollectionViewCell() }
        
        
        // UI image 표시
        let movie = movies[indexPath.item]
        let url = URL(string: movie.thumbnailPath)!
        
        // imagepath(string) -> UIImage
        // thirdparty = 외부코드(라이브러리) 가져다쓰기
        // url to image ios swift open source  -> Kingfisher
        cell.movieThumbnail.kf.setImage(with: url)
        
        // 셀을 알아보기 위한 표시
//        cell.backgroundColor = .red
        return cell
    }
}
// 클릭되었을때 구현해줘야 하니까.
extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // movie
        // player vc
        // player vc + movie
        // presenting player vc
        let movie = movies[indexPath.item]
        let url = URL(string: movie.previewURL)!
        let item = AVPlayerItem(url: url)
        
        let sb = UIStoryboard(name: "Player", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PlayerViewController") as! PlayerViewController
        //풀스크린 설정
        vc.modalPresentationStyle = .fullScreen
        
        vc.player.replaceCurrentItem(with: item)
        present(vc, animated: false, completion: nil)
        
        
    }
}
// 각셀의 크기를 조절해줘야 하니까 작성
// automatic -> NONE로 변경
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 8
        let itemSpacing: CGFloat = 10
        // (가로 UI의 크기 - 양쪽 마진 - 가운데 2줄 스페이스) 나누기 3 = 셀하나의 너비
        let width = (collectionView.bounds.width - margin * 2 - itemSpacing * 2) / 3
        // (세로 사이즈는 cell사이즈가 7:10 이므로 10/7 * 너비 하면나옴)
        let height = width * 10/7
        return CGSize(width: width, height: height)
    }
    
}
//collectionviewCell 만들어주기
class ResultCell: UICollectionViewCell {
    @IBOutlet weak var movieThumbnail: UIImageView!
}

// 서치바에서 일어나는 일들을 뷰컨트롤러에게 위임해서 일어나는 일들을 뷰컨트롤러에서 담당시키기 서치바 -> 검색 신에서 일어나는 일들을 뷰컨트롤러에게 위임 <Delegate> Scean에 연결

extension SearchViewController: UISearchBarDelegate {
    
    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    
    
    // search버튼이 클릭되었다고 뷰컨트롤러에 알려주는 메서드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print("--> 검색어: \(searchBar.text)")
        //키보드 필요없을때 내리기
        dismissKeyboard()
        
        //검색어 공백 거르기,
        guard let searchTerm = searchBar.text,
              searchTerm.isEmpty == false else {return}
        
        // 네트워킹을 통한 검색
        // - 목표: 서치텀을 가지고 네트워킹을 통해서 영화 검색
        // - [x]검색API가 필요
        // - [x]결과를 받아올 모델 Movie, Respone
        // - [x]결과를 받아와서, CollectionView로 표현해주자
//        print("--> 검색어: \(searchBar.text)")
        SearchAPI.search(searchTerm) { movies in
            // collectionView로 표현하기
            //   -->> 프로토콜, 데이타소스, 델리게이트, 플로우 레이아웃
            print("몇개넘어왔어? \(movies.count)")
            DispatchQueue.main.async {
                self.movies = movies
                // 이 아래코드는 UI쪽 main thred에 넘겨주어야 하는 부분인데 백그라운드 부분에서 불려서 오류가 나기때문에
                // DispatchQueue.main을 사용해 메인으로 넘겨주었다.
                self.resultCollectionView.reloadData()
            }
            
            
        }
    }
}

//이거는 궂이 인스턴스를 만들지 않아도 이 SearchAPI만 쓰면 가져다 쓸수있는 타입매서드를 만든것.
// 타입매서드는 해당하는 타입.매서드 를 하면 바로 호출가능
// 인스턴스 매서드는 메모리에 인스턴스가 올라가고 호출가능
class SearchAPI {
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        //escaping은 컴플리션의 안에 있는 코드블럭이 이 메서드 밖에서 실행될수도 있다. 라는뜻
        let session = URLSession(configuration: .default)
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
        let mediaQuery = URLQueryItem(name: "media", value: "movie")
        let entityQuery = URLQueryItem(name: "entity", value: "movie")
        let termQuery = URLQueryItem(name: "term", value: term)
        urlComponents.queryItems?.append(mediaQuery)
        urlComponents.queryItems?.append(entityQuery)
        urlComponents.queryItems?.append(termQuery)
        
        let requestURL = urlComponents.url!
        
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode,successRange.contains(statusCode) else {
                completion([])
                return
            }
            guard let resultData = data else {
                completion([])
                return
            }
            
//            //검색어 확인
//            let string = String(data: resultData, encoding: .utf8)
//            print("--> 검색은 \(string)")
            let movies = SearchAPI.parseMovies(resultData)
            completion(movies)
            print("--> result: \(movies.count)")
            
        }
        dataTask.resume()
    }
    
    static func parseMovies(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(Response.self, from: data)
            let movies = response.movies
            return movies
        } catch let error {
            print("--> parsing error \(error.localizedDescription)")
            return []
        }
    }
}
// 데이터를 받아오는 구조체
struct Response: Codable {
    let resultCount: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}
// 받은 데이터를 우리가원하는 객체로 변환하는 것
struct Movie: Codable {
    let title: String
    let director: String
    let thumbnailPath: String
    let previewURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case director = "artistName"
        case thumbnailPath = "artworkUrl100"
        case previewURL = "previewUrl"
    }
}
