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
        #warning("isTranslucent设置false，不然侧滑返回失效，tabbar图标偏移")
        tabBar.isTranslucent = false
        
        self.setupChildController()
    }

    deinit {
        print("---\(self.classForCoder)---")
    }
    
    //MARK: - Public
    
    //MARK: - Private
    
    //MARK: - Procotol

}

extension ZJYTabbarVC {
    private func setupChildController() {
        
        var subArr:[UIViewController] = []
        
        let sourceArr = [["className":"ZJYHomeVC","title":"首页","image":"icon_shouye1","selectedImage":"icon_shouye"],
                         ["className":"ZJYFindVC","title":"发现","image":"icon_faxian1","selectedImage":"icon_faxian"],
                         ["className":"ZJYOrderVC","title":"订单","image":"icon_dingdan1","selectedImage":"icon_dingdan"],
                         ["className":"ZJYMyVC","title":"我的","image":"icon_wode1","selectedImage":"icon_wode"]]
        
        for dic in sourceArr {
            subArr.append(configurationController(dic: dic))
        }
        self.setViewControllers(subArr, animated: true)
    }
    private func configurationController(dic:[String:String]) -> UIViewController {
        #warning("自定义类，通过字符串找类名，需要加上路径，即 命名空间")
        guard let clsName = dic["className"],
            let title = dic["title"],
            let image = dic["image"],
            let selectedImage = dic["selectedImage"],
            let cls = NSClassFromString(Bundle.main.namespace+"."+clsName) as? UIViewController.Type
            else {
            return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title;
        vc.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:FitFont(x: 11),NSAttributedString.Key.foregroundColor:color_darkGrayText], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:FitFont(x: 11),NSAttributedString.Key.foregroundColor:color_darkGrayText], for: .selected)
        
        let nav = UINavigationController.init(rootViewController: vc)
        
        return nav
    }
}
