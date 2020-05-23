//
//  ViewController.swift
//  10Radio
//
//  Created by Ash Duckett on 22/09/2019.
//  Copyright © 2019 Uncouth Studios. All rights reserved.
//

import UIKit
import GoogleMobileAds
import AVKit

class ViewController: UIViewController, GADBannerViewDelegate {
    
    var player: AVPlayer?
    var srcUrl: URL?
    var playerItem: AVPlayerItem!
    
    @IBOutlet weak var playButton: UIButton!
  
    func startRadio() {
        srcUrl = URL.init(string: "http://live.canstream.co.uk:8000/10radio.mp3.m3u")
        playerItem = AVPlayerItem(url: srcUrl!)
        player = AVPlayer(playerItem: playerItem)
        player!.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        self.view.layer.addSublayer(playerLayer)
        startRadio()
    }

    @IBAction func playButtonClicked(_ sender: Any) {
        if let _ = player {
            self.player!.pause()
            self.player = nil
            let playImage = UIImage(systemName: "play.fill")
            playButton.setBackgroundImage(playImage, for: .normal)
        } else {
            startRadio()
            let playImage = UIImage(systemName: "pause.fill")
            playButton.setBackgroundImage(playImage, for: .normal)
        }
    }
}

