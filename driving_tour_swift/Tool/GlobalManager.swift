//
//  GlobalManager.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/4/3.
//  Copyright © 2019 FKD. All rights reserved.
//

import Foundation

/*
 1,GCD方法，现在用编译器报错
 class GlobalManager {
    class var sharedManager : GlobalManager {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var staticInstance : GlobalManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.staticInstance = GlobalManager()
        }
        return Static.staticInstance!
    }
 }
 2,比GCD简单，线程安全
 class GlobalManager {
    class var sharedManager : GlobalManager {
        struct Static {
            static let sharedInstance : GlobalManager = GlobalManager()
        }
        return Static.sharedInstance
    }
 }
 3,比前面两个更简单
 private let sharedInstance = GlobalManager()
 class GlobalManager {
    class var sharedManager : GlobalManager {
        return sharedInstance
    }
 }
 
 推荐写法
 class GlobalManager {
    static let sharedInstance = GlobalManager()
    private init() {}//防止调用init方法
 }
 
 这种写法可以添加内部设置
 class GlobalManager {
    private static var sharedManager:GlobalManager {
        let share = GlobalManager()
        //添加通用配置
        return share
    }
    class func sharedInstance() -> GlobalManager {
        return sharedManager
    }
 }
*/

class GlobalManager {
    static let sharedInstance = GlobalManager()
    private init() {}//防止调用init方法
    
    var initModel:ZJYInitModel?
    var loginModel:ZJYLoginModel?
    var personInfoModel:ZJYPersonalInfoModel?
    var openCityList:[ZJYOpenCityModel]?
    
    
    
    
}
