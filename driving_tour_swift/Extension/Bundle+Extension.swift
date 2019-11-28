//
//  Bundle+Extension.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/11/28.
//  Copyright © 2019 FKD. All rights reserved.
//

import Foundation

extension Bundle {
    
    //返回命名空间字符串
    //    func namespace () -> String {
    ////        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    //        return infoDictionary?["CFBundleName"] as? String ?? ""
    //    }
    
    //计算型属性类似于函数, 没有参数,  有返回值 (OC 中 的函数,若没有参数,有返回值, 可用打点调用    [str copy] -> str.copy)
    var namespace:String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
