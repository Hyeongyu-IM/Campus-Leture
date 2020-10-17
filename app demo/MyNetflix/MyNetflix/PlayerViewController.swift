//
//  PlayerViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/01.
//  Copyright © 2020 com.joonwon. All rights reserved.
//
// 
import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    
    @IBOutlet weak var playerView: PlayerView!
    // controlView는 백그라운드를 clear color로 해야한다.
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    let player = AVPlayer()
    
    // 강제로 가로모드 만들어주기
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    
    @IBAction func togglePlaybutton(_ sender: Any) {
        playButton.isSelected = !playButton.isSelected
    }
    

    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}

extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}
