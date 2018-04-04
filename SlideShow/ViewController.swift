//
//  ViewController.swift
//  SlideShow
//
//  Created by HayakawaYusuke on 2018/03/17.
//  Copyright © 2018年 HayakawaYusuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var slideBack: UIButton!
    @IBOutlet weak var slideForward: UIButton!
    
    
    var timer: Timer!
    
    var slideNum = 0
    var imagesName = [
        "image1.jpg",
        "image6.jpg",
        "image5.jpg"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named: imagesName[slideNum])
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showSlide() {
        slideNum += 1
        
        if imagesName.count - 1 < slideNum {
            slideNum = 0
        }
        self.imageView.image = UIImage(named: imagesName[slideNum])
    }
    

    @IBAction func slideForward(_ sender: Any) {
        slideNum += 1
        
        if imagesName.count - 1 < slideNum {
            slideNum = 0
        }
        self.imageView.image = UIImage(named: imagesName[slideNum])
    }
    
    @IBAction func slideBack(_ sender: Any) {
        slideNum -= 1
        
        if slideNum < 0 {
            slideNum = imagesName.count - 1
        }
        self.imageView.image = UIImage(named: imagesName[slideNum])
    }
    
    @IBAction func slideStartStop(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(showSlide), userInfo: nil, repeats: true)
            self.slideBack.isEnabled = false
            self.slideForward.isEnabled = false
            self.startButton.setTitle("停止", for: .normal)
        }
        else {
            self.timer.invalidate()
            self.timer = nil
            self.slideBack.isEnabled = true
            self.slideForward.isEnabled = true
            self.startButton.setTitle("再生", for: .normal)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のViewControllerを取得する
        let slideViewController:slideViewController = segue.destination as! slideViewController
        
        slideViewController.image = UIImage(named: imagesName[slideNum])
        self.timer.invalidate()
        self.slideBack.isEnabled = true
        self.slideForward.isEnabled = true
        self.startButton.setTitle("再生", for: .normal)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }

}

