//
//  ZJYTabbarVC.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/26.
//  Copyright © 2019年 FKD. All rights reserved.
//

import UIKit

class ZJYTabbarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.layer.shadowColor = color_black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowOpacity = 0.1
        tabBar.tintColor = color_black
        #warning("isTranslucent设置false，不然侧滑返回失效，tabbar图标偏移---系统BUG")
        tabBar.isTranslucent = false
        
        var subArr:[UIViewController] = []
        
        let controllerArr:[String] = ["ZJYHomeVC","ZJYFindVC","ZJYOrderVC","ZJYMyVC"]
        let normalImgArr:[String] = ["icon_shouye1","icon_faxian1","icon_dingdan1","icon_wode1"];
        let selectedImgArr:[String] = ["icon_shouye","icon_faxian","icon_dingdan","icon_wode"];
        let nameArr:[String] = ["首页","发现","订单","我的"];
        
        for i in 0..<controllerArr.count {
            #warning("自定义类，通过字符串找类名，需要加上路径，swift特殊")
            let className = "driving_tour_swift."+controllerArr[i]//要有工程名路径
            let subClass = NSClassFromString(className) as! UIViewController.Type
            let controller = subClass.init()
            
            let nav = UINavigationController.init(rootViewController: controller)
            
            controller.title = nameArr[i]
//            nav.tabBarItem.tag = i
            controller.tabBarItem.image = UIImage.init(named: normalImgArr[i])?.withRenderingMode(.alwaysOriginal)
            controller.tabBarItem.selectedImage = UIImage.init(named: selectedImgArr[i])?.withRenderingMode(.alwaysOriginal)
            controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:FitFont(x: 11), NSAttributedString.Key.foregroundColor:color_darkGrayText], for: .normal)
            controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:FitFont(x: 11), NSAttributedString.Key.foregroundColor:color_darkGrayText], for: .selected)
            
            subArr.append(nav)
        }
        self.setViewControllers(subArr, animated: true)
    }

    deinit {
        print("---\(self.className())---")
    }
    
    //MARK: - Public
    
    //MARK: - Private
    
    //MARK: - Procotol

}
