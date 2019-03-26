//
//  ZJYTabbarVC.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/26.
//  Copyright © 2019年 FKD. All rights reserved.
//

import UIKit

class ZJYTabbarVC: UITabBarController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.layer.shadowColor = color_black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowOpacity = 0.1
        tabBar.tintColor = color_black
        
        var subArr:[UIViewController] = []
        
        let controllerArr:[String] = ["ZJYHomeVC","ZJYFindVC","ZJYOrderVC","ZJYMyVC"]
        let normalImgArr:[String] = ["icon_shouye1","icon_faxian1","icon_dingdan1","icon_wode1"];
        let selectedImgArr:[String] = ["icon_shouye","icon_faxian","icon_dingdan","icon_wode"];
        let nameArr:[String] = ["首页","发现","订单","我的"];
        
        for i in 0..<controllerArr.count {
            let className = "driving_tour_swift."+controllerArr[i]//要有工程名路径
            let subClass = NSClassFromString(className) as! UIViewController.Type
            let nav = UINavigationController.init(rootViewController: subClass.init())
            
            nav.tabBarItem.title = nameArr[i]
            nav.tabBarItem.tag = i
            nav.tabBarItem.image = UIImage.init(named: normalImgArr[i])?.withRenderingMode(.alwaysOriginal)
            nav.tabBarItem.selectedImage = UIImage.init(named: selectedImgArr[i])?.withRenderingMode(.alwaysOriginal)
            nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:FitFont(x: 11), NSAttributedString.Key.foregroundColor:color_darkGrayText], for: .normal)
            nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:FitFont(x: 11), NSAttributedString.Key.foregroundColor:color_darkGrayText], for: .selected)
            
            subArr.append(nav)
        }
        self.setViewControllers(subArr, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    deinit {
        print("---\(self.className())---")
    }
    
    //MARK: - Public
    
    //MARK: - Private
    
    //MARK: - Procotol

}
