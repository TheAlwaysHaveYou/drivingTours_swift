//
//  ZJYPersonalInfoModel.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/4/1.
//  Copyright © 2019 FKD. All rights reserved.
//

import UIKit

class ZJYPersonalInfoModel: Decodable {
    /**
     headUrl    是    string    V32    头像
     nikeName    是    string    V32    昵称
     sex    是    string    V32    性别
     age    是    string    V32    年龄
     profession    是    string    V32    职业
     idPicUrl    是    string    V32    身份证正面照片
     idInHandUrl    是    string    V32    手持身份证照片
     realName    是    string    V32    真实姓名
     realSex    是    string    V32    真实性别
     id    是    string    V32    身份证号
     drivingPicUrl    是    string    V32    驾驶证图片地址
     licenseId    是    string    V32    驾驶证号
     drivingDeadline    是    string    V32    驾照截至有效期
     industry    是    string    V32    行业    1.IT/通信/电子/互联网 2.金融业 3.房地产/建筑业 4.商业服务 5.贸易/批发/零售/租赁 6.文体教育/工艺美术 7.生产/加工/制造 8.交通/运输/物流/仓储 9.服务业 10.文化/传媒/娱乐/体育 11.能源/矿产/环保 12.政府/非盈利机构 13.农/林/牧/渔/其他
     signature    是    string    V32    签名
     company    是    string    V32    公司
     vipLevel    是    string    V32    会员等级
     authStatus    是    string    V32    身份认证状态        0未认证 1已认证
     
     从服务获取 与更新给服务器都是这些字段
     */
    var headerUrl:String?
    var nikeName:String?
    var sex:String?
    var age:String?
    var profession:String?
    var idPicUrl:String?
    var idInHandUrl:String?
    var realName:String?
    var realSex:String?
    var id:String?
    var drivingPicUrl:String?
    var licenseId:String?
    var drivingDeadline:String?
    var industry:String?
    var signature:String?
    var company:String?
    var vipLevel:String?
    var authStatus:String?
    
    /**
     提交给服务器用的
     */
    var userId:String?
    
    
}
