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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var adBannerView: GADBannerView?
        var player: AVPlayer?
        let request = GADRequest()
//        request.testDevices = [(kGADSimulatorID as! String)]
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [(kGADSimulatorID as! String)]
        adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        // adBannerView?.adUnitID = "ca-app-pub-4647277951971448/7305051200"
        adBannerView?.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        adBannerView?.delegate = self
        adBannerView?.rootViewController = self
        
        adBannerView?.load(GADRequest())
        
        
        
        view.addSubview(adBannerView!)

        adBannerView?.translatesAutoresizingMaskIntoConstraints = false


        view.addConstraint(NSLayoutConstraint(item: adBannerView!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: adBannerView!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0))
        
        
        
        
        
        
        
        let url = URL.init(string: "http://live.canstream.co.uk:8000/10radio.mp3.m3u")
        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player!)
        
        
        
        playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        self.view.layer.addSublayer(playerLayer)
        player?.play()
    }


}

