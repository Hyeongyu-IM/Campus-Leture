//
//  DetailViewController.swift
//  BountyList
//
//  Created by 임현규 on 2020/10/01.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MVVM
    
    //Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    //View
    // - imgView, nameLabel, BountyLabel
    // > View들은 ViewModel을 통해서 구성되기 ?
    
    //ViewModel
    // - DetailViewModel
    // > 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 ,, BountyInfo 들
    
    
       @IBOutlet weak var imgView: UIImageView!
       @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?
//    var bountyInfo: BountyInfo?

    let viewModel = DetailViewModel()
    
    //viewDidLoad는 뷰컨트롤러가 실제 메모리에 올라오기 직전에 호출됩니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func  updateUI() {
        
        if let bountyInfo = viewModel.bountyInfo {
            
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
//        if let bountyInfo = self.bountyInfo {
//
//            imgView.image = bountyInfo.image
//            nameLabel.text = bountyInfo.name
//            bountyLabel.text = "\(bountyInfo.bounty)"
        }
//        if let name = self.name, let bounty = self.bounty {
//            let img = UIImage(named: "\(name).jpg")
//            imgView.image = img
//            nameLabel.text = name
//            bountyLabel.text = "\(bounty)"
//        }
    }
  
    @IBAction func close(_ sender: Any) {
        // 눌리면 사라지게 만들어준다 completion은 사라지고 나서 동작할 액션을 입력할수있는 코드
        dismiss(animated: true, completion: nil)
    }
    
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    // 이 메서드는 prepare로부터 받아오는 값을 uiupdate에 넘겨줄때 쓰인다 . 별표!!!#########
    // 받는값은 똑같이 바운티 인포로 들어오기때문에 옵셔널!
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
