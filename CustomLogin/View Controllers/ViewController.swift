//
//  ViewController.swift
//  CustomLogin
//
//  Created by Alcides Tiago on 03/01/20.
//  Copyright © 2020 iAFT. All rights reserved.
//

import UIKit
import AVKit

var videoPlayer:AVPlayer?
var videoPlayerLayer:AVPlayerLayer?

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
     
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loadin g the view.
        
        setUpElements()
    }
        override func viewWillAppear(_ Animated: Bool) {
            
        // setUp Video background
            setUpVideo()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        
        Utilities.styleFilledButton(loginButton)
        
    }
    func setUpVideo(){
         //Get the path to the resource in the bundle
       let bundlePath = Bundle.main.path(forResource: "Loginbg", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        //Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        //Create video player item
        let item = AVPlayerItem(url: url)
        //Create the player
        videoPlayer =  AVPlayer(playerItem: item)
        //Create layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        //Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x:
            -self.view.frame.size.width*1.5, y:0, width:
            self.view.frame.size.width*4, height:
            self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        //Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 0.3)
  
        
    }
}

