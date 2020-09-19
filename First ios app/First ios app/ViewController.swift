//
//  ViewController.swift
//  First ios app
//
//  Created by 임현규 on 2020/09/19.
//  Copyright © 2020 임현규. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "My First App!!", preferredStyle: .alert)
        //알림창의 내용을 구성 Hello, My First App
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        // 알림창의 버튼을 구성, handler는 알림창을 끄고나서의 액션
        alert.addAction(action)
        // 여기까지가 알럿을 만드는 과정
        present(alert, animated: true, completion: nil)
//프레젠트로 알럿을 띄움
        //여기까지가 알럿을 띄우는 과정
    }
        
       
        }
        
        
        

    



