//
//  ZJYHomeVC.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/26.
//  Copyright © 2019年 FKD. All rights reserved.
//

import UIKit

class ZJYHomeVC: ZJYBaseViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "首页"
        
//        HTTPRequestManager.originPost(url: serverBaseURL(add: "organization/queryAdList"), params: nil) { (data, result) in
//            if result {
//                let tempModel = try? JSONDecoder().decode(ZJYHomeADModel.self, from: data as! Data)
//                print("\(String(describing: tempModel))---数据")
//            }else {
//
//            }
//        }
        HTTPRequestManager.postRequest(url: serverBaseURL(add: "organization/queryAdList"), params: nil) { (data , result) in
            if result {
//                let tempModel = try? JSONDecoder().decode(ZJYHomeADModel.self, from: data as! Data)
//                print("\(String(describing: tempModel))---数据")
                let json = try? JSONSerialization.jsonObject(with: data as! Data, options: .mutableContainers) as? [String : Any]
                
                print("返回字典--\(json)")
                
            }else {
                print("报错啦----\(data)")
            }
        }
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
        print("---\(self.classForCoder)---")
    }
    
    //MARK: - Public
    
    //MARK: - Private
    
    //MARK: - Procotol
    
    
}
