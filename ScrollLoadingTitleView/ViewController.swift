//
//  ViewController.swift
//  ScrollLoadingTitleView
//
//  Created by wuguanyu on 16/10/11.
//  Copyright © 2016年 wuguanyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let loadingTitleLabelView: UILabel = {
        let aLabel = UILabel(frame: CGRect(x: 0, y: 00, width: 100, height: 44))
        aLabel.backgroundColor = UIColor.clear
        aLabel.textAlignment = .center
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 16)
        aLabel.adjustsFontSizeToFitWidth = true
        aLabel.text = "Loading"
        
        return aLabel
    }()
    
    let originTitleView: UIImageView = {
        guard let aImg = UIImage(named: "AppTitle") else { return UIImageView() }
        let aImageView = UIImageView(image: aImg)
        
        aImageView.frame = CGRect(x: 0, y: 0, width: aImg.size.width, height: aImg.size.height)
        return aImageView
    }()
    
    let containerView: UIView = {
        let aView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        aView.clipsToBounds = true
        return aView
    }()
    
    @IBAction func loadContent(_ sender: AnyObject) {
        loadData()

        let loadingTitleLabelHeight = loadingTitleLabelView.frame.size.height
        let loadingTitleLabelWidth = loadingTitleLabelView.frame.size.width
        loadingTitleLabelView.frame = CGRect(x: 0, y: -loadingTitleLabelHeight, width: loadingTitleLabelWidth, height: loadingTitleLabelHeight)
        containerView.addSubview(loadingTitleLabelView)

        addPushAnimation(at: loadingTitleLabelView)
        addPushAnimation(at: originTitleView)
        
    }
    
    func addPushAnimation(at view: UIView) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
                view.frame.origin = CGPoint(x: view.frame.origin.x, y: view.frame.origin.y + view.frame.size.height)
            }) { (finished) in
                
        }
//        let animation = CATransition()
//        animation.duration = 0.38
//        animation.type = kCATransitionPush
//        animation.subtype = kCATransitionFromBottom
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        
//        view.layer.add(animation, forKey: "Scroll_title")
        
    }
    
    func better() {
    }
    
    func doThis() -> Void {
    }

    func NotDoThis() -> () {
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        containerView.addSubview(titleLabelView)
        containerView.addSubview(originTitleView)
        self.navigationItem.titleView = containerView
//        titleLabelView.superview?.clipsToBounds = true
//        titleLabelView.layer.masksToBounds = true
//        titleLabelView.backgroundColor = UIColor.darkGray
        
//        UIInterfaceOrientationMask.landscape
        
        
        let array = [1, 3, 5]
        if array.isEmpty {
        }
        
        if array.count == 0 {
        }
        
        
        UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
        
        let circumference = 2 * .pi * 10.0
        let aView = SubView(frame: CGRect(x:0, y: 100, width: 100, height: 100))
        self.view.addSubview(aView)
        
    }

    func loadData() {
        let delayTime = DispatchTime.now() + .seconds(3)
        DispatchQueue.main.asyncAfter(deadline: delayTime) { [weak self] in
            
            guard let `self` = self else { return }
        
            print("Load Finish")
            
            // Loading Title View Hidden
            self.addPushAnimation(at: self.loadingTitleLabelView)
            
            // Reset Origin Title View
            let originTitleViewHeight = self.originTitleView.frame.size.height
            let originTitleViewWidth = self.originTitleView.frame.size.width
            self.originTitleView.frame = CGRect(x: 0, y: -originTitleViewHeight, width: originTitleViewWidth, height: originTitleViewHeight)

            self.addPushAnimation(at: self.originTitleView)
        }
    }
}

