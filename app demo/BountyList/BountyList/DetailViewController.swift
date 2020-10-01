//
//  DetailViewController.swift
//  BountyList
//
//  Created by 임현규 on 2020/10/01.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
       @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?

    //viewDidLoad는 뷰컨트롤러가 실제 메모리에 올라오기 직전에 호출됩니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func  updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
  
    @IBAction func close(_ sender: Any) {
        // 눌리면 사라지게 만들어준다 completion은 사라지고 나서 동작할 액션을 입력할수있는 코드
        dismiss(animated: true, completion: nil)
    }
    
}
