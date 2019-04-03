//
//  ZJYLoginModel.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/4/3.
//  Copyright © 2019 FKD. All rights reserved.
//

import UIKit

class ZJYLoginModel: ZJYBaseModel {
    /**
     userId    是    string    V32    用户id
     token    是    string    V32    token
     realName    是    string    V32    用户姓名
     nickName    是    string    V32    用户姓名
     passwordFlag    是    string    V32    是否已经设置密码    0未设置 1已设置
     mobile    是    string    V32    手机号
     headUrl    是    string    V32    头像
     */
    var userId:String?
    var token:String?
    var depositStatus:String?
    var realName:String?
    var nickName:String?
    var passwordFlag:String?
    var mobile:String?
    var headUrl:String?
    
    //loginStatus    是    string    V32    授权登陆状态    0为已成功授权登陆，1为用户需绑定自家游账户
    var loginStatus:String?
}
