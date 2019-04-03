//
//  ZJYInitModel.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/4/3.
//  Copyright © 2019 FKD. All rights reserved.
//

import UIKit

class ZJYInitModel: ZJYBaseModel {
    /**
     platformCustomerPhone    是    string    V32    平台客服电话
     startupPage    是    string    V32    启动页地址
     shareContent    是    string    V32    分享内容
     shareTitle    是    string    V32    分享标题
     shareUrl    是    string    V32    分享链接
     sharePicUrl    是    string    V32    分享图片地址
     */
    var platformCustomerPhone:String?
    var startupPage:String?
    var shareContent:String?
    var shareTitle:String?
    var shareUrl:String?
    var sharePicUrl:String?
    var startupPageForwordUrl:String?
    var dataList:[ZJYOpenCityModel]?
    var cityCodeArray:[Any]?
}
