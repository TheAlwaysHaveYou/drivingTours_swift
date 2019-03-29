//
//  UIButton+Extension.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/29.
//  Copyright © 2019 FKD. All rights reserved.
//

import Foundation

enum BtnImgDirection:Int {
    case top    = 0
    case left   = 1
    case bottom = 2
    case right  = 3
    case center = 4
}

extension UIButton {
    func setImageDirection(ditection:BtnImgDirection) -> () {
        self.setImageDirection(direction: ditection, span: 0)
    }
    
    func setImageDirection(direction:BtnImgDirection, span:CGFloat) -> () {
        let imageWidth = self.imageView?.image?.size.width ?? 0.0
        let imageHeight = self.imageView?.image?.size.height ?? 0.0
        var labelWidth:CGFloat = 0.0
        var labelHeight:CGFloat = 0.0
        if (UIDevice.current.systemVersion.longValue >= Int(8.0)) {
            labelWidth = (self.titleLabel?.intrinsicContentSize.width)!
            labelHeight = (self.titleLabel?.intrinsicContentSize.height)!
        }else {
            labelWidth = (self.titleLabel?.frame.size.width)!
            labelHeight = (self.titleLabel?.frame.size.height)!
        }
        
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        switch direction {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-span/2.0, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight-span/2.0, right: 0)
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -span/2.0, bottom: 0, right: span/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: span/2.0, bottom: 0, right: -span/2.0)
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-span/2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-span/2.0, left: -imageWidth, bottom: 0, right: 0)
        case .right:
            if (self.width==0) {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+span/2.0, bottom: 0, right: -labelWidth-span/2.0)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth-span/2.0, bottom: 0, right: imageWidth+span/2.0)
            }else if (labelWidth+imageWidth<self.width) {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+span/2.0, bottom: 0, right: -labelWidth-span/2.0)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth-span/2.0, bottom: 0, right: imageWidth+span/2.0)
            }else {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: self.width-imageWidth+span/2.0, bottom: 0, right: 0)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth-span/2.0, bottom: 0, right: imageWidth+span/2.0)
            }
        default:
            break
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
}
