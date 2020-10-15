//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/02.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        // - 검색API가 필요
        // - 결과를 받아올 모델 Movie, Respone
        // - 결과를 받아와서, CollectionView로 표현해주자
        print("--> 검색어: \(searchBar.text)")
        SearchAPI.search(searchTerm) { movies in
            // collectionView로 표현하기
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
        
        var urlComponents = URLComponents(string: "http://itunes.apple.com/search?")!
        let mediaQuery = URLQueryItem(name: "media", value: "movie")
        let entityQuery = URLQueryItem(name: "entity", value: "movie")
        let termQuery = URLQueryItem(name: "term", value: term)
        urlComponents.queryItems?.append(mediaQuery)
        urlComponents.queryItems?.append(entityQuery)
        urlComponents.queryItems?.append(termQuery)
        
        let requestURL = urlComponents.url!
        
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode,successRange.contains(statusCode) else { return completion([])}
            guard let resultData = data else {
                completion([])
                return
            }
//            //검색어 확인
//            let string = String(data: resultData, encoding: .utf8)
//            print("--> 검색은 \(string)")
            
            completion([Movie])
            
        }
        dataTask.resume()
    }
}

struct Response {
    
}

struct Movie {
    
}
