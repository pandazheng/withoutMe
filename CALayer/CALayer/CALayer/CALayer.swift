//
//  CALayer.swift
//  CALayer
//
//  Created by xiangwenwen on 15/7/5.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

import Foundation
import UIKit

class CALayerViewController:UIViewController {
    
    override func viewDidLoad() {
        var layer:CALayer = CALayer()
        layer.frame = CGRectMake(50, 50, 200, 200)
        layer.backgroundColor = UIColor(red: 0.400, green: 0.800, blue: 1.000, alpha: 1.000).CGColor
        self.view.layer.addSublayer(layer)        
        var image:UIImage = UIImage(named: "mockingbird.png")!
        layer.contents =  image.CGImage
    }
    
    override func didReceiveMemoryWarning() {
        
    }
}