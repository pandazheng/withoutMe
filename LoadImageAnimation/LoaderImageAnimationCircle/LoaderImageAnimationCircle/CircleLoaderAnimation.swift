//
//  CircleLoaderAnimation.swift
//  LoaderImageAnimationCircle
//
//  Created by xiangwenwen on 15/6/18.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

import UIKit

/*
    思路是通过CAShapeLayer和UIBezierPath来画圆

    SDWebImage库帮助我们计算了下载的progress 进度，它是一个CGFloat ，设置progress控制圆的绘制路径

    下载完成之后，通过设置圆的frame跟layer相同，动画慢慢扩张，即可。

    最后设置mask 为nil 并把圆的layer移除

*/

class CircleLoaderAnimation: UIView {
    
    let circularPathLayer = CAShapeLayer() //圆的路径
    let circuRadius:CGFloat = 20.0  //圆的半径
    
    var progress:CGFloat{  //进度数
        get{
            return self.circularPathLayer.strokeEnd
        }
        set(progressNumber){
            if progressNumber > 1{
                self.circularPathLayer.strokeEnd = 1.0
            }else if progressNumber < 0{
                self.circularPathLayer.strokeEnd = 0.0
            }else{
                self.circularPathLayer.strokeEnd = progressNumber
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.circularPathLayer.frame = self.bounds
        self.circularPathLayer.path = self.circlePath().CGPath
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.superview?.layer.mask = nil
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure()->Void{
        self.progress = 0.0
        self.circularPathLayer.frame = self.bounds
        self.circularPathLayer.lineWidth = 2
        self.circularPathLayer.fillColor = UIColor.clearColor().CGColor
        self.circularPathLayer.strokeColor = UIColor(red: 0.000, green: 0.502, blue: 0.502, alpha: 1.000).CGColor
        self.layer.addSublayer(self.circularPathLayer)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    func circleFrame()-> CGRect{
        var circleFrame = CGRectMake(0, 0, 2*self.circuRadius, 2*self.circuRadius)
        circleFrame.origin.x = CGRectGetMidX(self.circularPathLayer.bounds) - CGRectGetMidX(circleFrame)
        circleFrame.origin.y = CGRectGetMidY(self.circularPathLayer.bounds) - CGRectGetMidY(circleFrame)
        return circleFrame
    }
    
    func circlePath()->UIBezierPath{
        return UIBezierPath(ovalInRect: self.circleFrame())
    }
    
    func reveal()-> Void{
        self.backgroundColor = UIColor.clearColor()
        self.progress = 1
        self.circularPathLayer.removeAnimationForKey("strokeEnd")
        self.circularPathLayer.removeFromSuperlayer()
        self.superview?.layer.mask = self.circularPathLayer
        
        let center = CGPoint(x: CGRectGetMidX(self.bounds), y: CGRectGetMidY(self.bounds))
        let finalRadius = sqrt((center.x*center.x)+(center.y*center.y))
        let radiusInset = finalRadius - self.circuRadius
        let outerRect = CGRectInset(self.circleFrame(), -radiusInset, -radiusInset)
        let toPath = UIBezierPath(ovalInRect: outerRect).CGPath
        let fromPath = self.circularPathLayer.path
        let fromLineWidth = self.circularPathLayer.lineWidth
        
        CATransaction.begin()
        CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
        self.circularPathLayer.lineWidth = 2*finalRadius
        self.circularPathLayer.path = toPath
        CATransaction.commit()
        
        let lineWidthAnimation = CABasicAnimation(keyPath: "lineWidth")
        lineWidthAnimation.fromValue = fromLineWidth
        lineWidthAnimation.toValue = 2*finalRadius
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = fromPath
        pathAnimation.toValue = toPath
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 1
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        groupAnimation.animations = [pathAnimation, lineWidthAnimation]
        groupAnimation.delegate = self
        self.circularPathLayer.addAnimation(groupAnimation, forKey: "strokeWidth")
    }
}
