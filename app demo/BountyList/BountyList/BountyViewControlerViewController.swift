//
//  BountyViewControlerViewController.swift
//  BountyList
//
//  Created by 임현규 on 2020/10/01.
//

import UIKit

class BountyViewControlerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MVVM
    
    //Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    //View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModel한테서 받아야 겠다.
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
    
    //ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들고, 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 ,, BountyInfo 들
    
//    let bountyInfoList: [BountyInfo] = [
//        BountyInfo(name: "brook", bounty: 33000000),
//        BountyInfo(name: "chopper", bounty: 50),
//        BountyInfo(name: "franky", bounty: 44000000),
//        BountyInfo(name: "luffy", bounty: 300000000),
//        BountyInfo(name: "nami", bounty: 16000000),
//        BountyInfo(name: "robin", bounty: 80000000),
//        BountyInfo(name: "sanji", bounty: 77000000),
//        BountyInfo(name: "zoro", bounty: 120000000)
//    ]
    
    //뷰모델 생성
    // 위모델을 없앴을때 빨간색 에러가 뜨는 것들을 수정해 주어야 한다.
    let viewModel = BountyViewModel()
    
    // 아래에는 클릭되었을때의 segue를 실행할때 데이터를 넘겨주자! 를 작성
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //DetailViewController에게 데이터를 넘겨준다.
        // 지정된 identity와 페이지를 받아 destination을 지정해주고
        // sender를 통해 넘어온 정보를 옵셔널로해서 받아서 읽어줄수있다
        if segue.identifier == "showDetail" {
            let ve = segue.destination as? DetailViewController
            
            // 센더로 데이터 넘버를 받는다.
            if let index = sender as? Int{
//                let bountyInfo = bountyInfoList[index]
                let bountyInfo = viewModel.bountyInfo(at: index)
                ve?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //UITableViewDataSource
    // cell의 개수가 몇개야?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return bountyList.count
//        return bountyInfoList.count
        return viewModel.numOfBountyInfoList
        
        // 응 2개야
//        return 2
    }
    // 어떻게 표현할껀데??
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // "cell" 은 여러 셀중에 이름을 구분하기 위해 이름을 지정해 주는 것이다.
        // indexPath는 셀의 위치를 지정해주는것
        //여기서 guard는 cell이 ListCell을 받을 경우 값이 없을 경우가 있을수 있기 때문에 값이 없을경우 UITableViewCell을 쓰라고 알려주는 것이다
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        // 이렇게 설정된 cell을 반환해줘. 라고 하는것
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imgView.image = img
//        cell.nameLabel.text = nameList[indexPath.row] // 얘는 원래 문자열이라서 "" 안해줘도 ㅇㅋ
//        cell.bountyLabel.text = "\(bountyList[indexPath.row])"  //읽는 타입이 숫자라서 문자열로 "" 표시해준다
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        
        
        //        cell.imgView.image = bountyInfo.image
//        cell.nameLabel.text = bountyInfo.name // 얘는 원래 문자열이라서 "" 안해줘도 ㅇㅋ
//        cell.bountyLabel.text = "\(bountyInfo.bounty)"  //읽는 타입이 숫자라서 문자열로 "" 표시해준다
        return cell
    }
    
    //UITableViewDelegate
    // 발생하는 이벤트를 지정해 주어야한다.
    //아래는 클릭시 해당셀의 번호를 프린트 해주는것
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(indexPath.row)")
        // 지정된 segue를 실행시켜줘 라는뜻.
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        // 섹션이 하나뿐이 없기때문에 row로 작성을 하면된다.( 데이터를 보낼때)
        // indexPath.row 는 몇번째 데이터가 클릭되었는지.
    }
    
}

//CustomCell
// 커스텀 셀을 만들때는 하나하나의 요소를 연결해주어야 하고
// 클래스로 만들어 관리해 주어야 한다.
class ListCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update( info: BountyInfo ) {
        imgView.image = info.image
        nameLabel.text = info.name // 얘는 원래 문자열이라서 "" 안해줘도 ㅇㅋ
        bountyLabel.text = "\(info.bounty)"  //읽는 타입이 숫자라서 문자열로 "" 표시해준다
    }
    
}

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}

//뷰모델은 모델데이터를 가지고 있어야한다.
class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    // 정렬 안에 수식은 클로저
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBountyInfoList: Int {
      return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}
