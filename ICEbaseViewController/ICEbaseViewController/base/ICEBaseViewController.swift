//
//  ICEBaseViewController.swift
//  ICEbaseViewController
//
//  Created by xiangwenwen on 15/8/18.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

import UIKit

class ICEBaseViewController: UIViewController {
    
    var backBtn:UIButton? = nil
    var completion:((Void)->Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setup(){
        self.backBtn = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        self.backBtn?.frame = CGRectMake(0, 0, 20, 20)
        self.backBtn?.setBackgroundImage(UIImage(named: "global_back"), forState: UIControlState.Normal)
        self.backBtn?.addTarget(self, action:Selector("upForback"), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.backBtn!)
    }
    
    internal func upForback(){
        if self.navigationController?.viewControllers.count > 1{
            self.navigationController?.popViewControllerAnimated(true)
            self.completion!()
        }
    }
    
    func setCustomTitle(title:String){
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 20))
        titleLabel.text = title
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont.systemFontOfSize(18)
        titleLabel.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = titleLabel
    }
    
    func setCustomTitleLeftButton(title:String,completion:()->Void){
        self.setCustomTitle(title)
        self.setup()
        self.completion = completion
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
