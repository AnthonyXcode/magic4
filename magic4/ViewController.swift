//
//  ViewController.swift
//  magic4
//
//  Created by Anthony on 7/9/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var ischanged:Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ischanged = false
        image.image = UIImage(named: "applefull")
    }
    
    override func viewDidAppear(animated: Bool) {
        listenVolumeButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(!ischanged){
            image.image = UIImage(named: "apple")
        }
    }
    
    func listenVolumeButton(){
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(true)
        audioSession.addObserver(self, forKeyPath: "outputVolume",
                                 options: NSKeyValueObservingOptions.New, context: nil)
        let volumeView: MPVolumeView = MPVolumeView(frame: CGRectZero)
        view.addSubview(volumeView)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "outputVolume"{
            image.image = UIImage(named: "applefull")
            ischanged = false
        }
    }
}

