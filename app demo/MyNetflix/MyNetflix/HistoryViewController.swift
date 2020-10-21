//
//  HistoryViewController.swift
//  MyNetflix
//
//  Created by 임현규 on 2020/10/21.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // 어디서 가져올 값인지를 지정해준것
    let db = Database.database().reference().child("searchHistory")
    var searchTerms: [SearchTerm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // 뷰가 보여지려고할때 네트워크 통신
    // 저장된 데이터를 불러오기
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 저장된 데이터를 파싱해서 넘겨주어야 합니다.
        db.observeSingleEvent(of: .value) { (snapshot) in
            
            guard let searchHistory = snapshot.value as? [String: Any] else { return }
//            let datas = Array(searchHistory.values) //배열안에 딕셔너리가 있는형태, 이값을 파싱해서 넘겨주어야 한다.
            // 명백하기때문에 그냥 try! 를 사용해줌
            let data = try! JSONSerialization.data(withJSONObject: Array(searchHistory.values), options: [])
            
            let decoder = JSONDecoder()
            
            // 디코딩은 포장을 뜻어서 어떤식으로 표현하고 싶은지를 작성하는것
            // 중요한것은 코더블에 작성된 이름이 맞아야 하고 만약 키값이 안맞으면 지정을 해주어야한다.
            let searchTerms = try! decoder.decode([SearchTerm].self, from: data)
            // values를 붙이면 id값(key)이 안나오고 값만 나오게 된다.
            
            // 타임스탬프 정렬
            self.searchTerms = searchTerms.sorted(by: { $0.timestamp > $1.timestamp })
            // 쌤님 코드
//            self.searchTerms = searchTerms.sorted(by:{ (term1, term2) in
//                         return term1.timestamp > term2.timestamp
//                    )}
            
            // 파싱된 데이터를 세팅
            self.searchTerms = searchTerms
            self.tableView.reloadData()
            
            print("--> snapshot \(searchHistory.values)")
//            print("--> snapshot \(snapshot.value)")
        }
    }
}

// 맨날 하던거지? 몇개와 어떻게 표현 할것인지
extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryCell else { return UITableViewCell() }
        cell.searchTerm.text = searchTerms[indexPath.row].term
        return cell
        }
    }


//커스텀셀
class HistoryCell: UITableViewCell {
    @IBOutlet weak var searchTerm: UILabel!
}

struct SearchTerm: Codable {
    let term: String
    // 시간관련 타입
    let timestamp: TimeInterval
}
