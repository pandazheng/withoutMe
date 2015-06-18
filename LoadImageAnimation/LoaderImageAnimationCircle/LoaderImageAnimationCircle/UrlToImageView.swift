//
//  UrlToImageView.swift
//  LoaderImageAnimationCircle
//
//  Created by xiangwenwen on 15/6/18.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

import UIKit

class UrlToImageView: UIImageView {
    
    let progressIndicatorView = CircleLoaderAnimation(frame: CGRectZero)
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(self.progressIndicatorView)
        self.progressIndicatorView.frame = self.bounds
        self.progressIndicatorView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        
        let url = NSURL(string: "http://content.battlenet.com.cn/wow/media/wallpapers/bosses/lich-king/lich-king-1920x1200.jpg")
        sd_setImageWithURL(url, placeholderImage: nil, options: .CacheMemoryOnly, progress: {
            [weak self]
            (receivedSize, expectedSize) -> Void in
            // 更新进度
            self?.progressIndicatorView.progress = CGFloat(receivedSize)/CGFloat(expectedSize)
            }) {
                [weak self]
                (image, error, _, _) -> Void in
                // 清除动画
                self?.progressIndicatorView.reveal()
        }
    }
}
