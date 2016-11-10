//
//  SubView.swift
//  ScrollLoadingTitleView
//
//  Created by wuguanyu on 16/10/13.
//  Copyright © 2016年 wuguanyu. All rights reserved.
//

import UIKit

class SubView: UIView {

    override func draw(_ rect: CGRect) {
        if let ctx = UIGraphicsGetCurrentContext() {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            ctx.setFillColor(UIColor.blue.cgColor)
            ctx.setLineWidth(1)
            ctx.addRect(rect)
            ctx.drawPath(using: .fillStroke)
            
            UIGraphicsEndImageContext()
        }
        
    }

}
