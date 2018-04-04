//
//  slideViewController.swift
//  SlideShow
//
//  Created by HayakawaYusuke on 2018/04/04.
//  Copyright © 2018年 HayakawaYusuke. All rights reserved.
//

import UIKit

class slideViewController: UIViewController {

    @IBOutlet weak var slide: UIImageView!
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        slide.image = self.image

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
