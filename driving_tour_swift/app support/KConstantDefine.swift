//
//  KConstantDefine.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/26.
//  Copyright © 2019年 FKD. All rights reserved.
//

import Foundation
import SnapKit
import RxSwift
import Kingfisher
import Alamofire

let kSCREEN_WIDTH  = UIScreen.main.bounds.size.width
let KSCREEN_HEIGHT = UIScreen.main.bounds.size.width

let color_navbar          = UIColor.white
let color_otherMain       = UIColor.init(hexString: "#666666")!
let color_redText         = UIColor.init(hexString: "#FB4E44")!
let color_blackText       = UIColor.init(hexString: "#333333")!
let color_lightBlackText  = UIColor.init(red: 70, green: 70, blue: 70, alpha: 1)
let color_blueText        = UIColor.init(red: 33, green: 118, blue: 246, alpha: 1)
let color_grayText        = UIColor.init(hexString: "#9c9c9c")!
let color_grayLine        = UIColor.init(hexString: "#f2f2f2")!
let color_whiteText       = UIColor.white
let color_darkGrayText    = UIColor.init(hexString: "#666666")!
let color_disableGray     = UIColor.init(hexString: "#D5D6DC")!  //设计新给的颜色
let color_bgWhite         = UIColor.init(hexString: "#f8f8f8")!
let color_yellowText      = UIColor.init(hexString: "#fd8238")!
let color_black           = UIColor.init(hexString: "#000000")!
let color_white           = UIColor.white
let color_yellowBack      = UIColor.init(hexString: "#FFF0E7")!
let color_greenText       = UIColor.init(hexString: "#33BCA2")!

func FITSCALE(number:CGFloat) -> CGFloat {
    return ((number)*kSCREEN_WIDTH*1.0/375.0)
}

let small_font       = FITSCALE(number: 12)
let normal_font      = FITSCALE(number: 14)
let big_font         = FITSCALE(number: 18)
let normal_bigerFont = FITSCALE(number: 16)

func FitFont(x:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: x)
}
func FitBorderFont(x:CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: x)
}

func IMGNAME(tip:String) -> UIImage {
    return UIImage.init(named: tip)!
}