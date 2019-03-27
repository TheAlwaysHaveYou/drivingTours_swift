//
//  ZJYBaseViewController.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/26.
//  Copyright © 2019年 FKD. All rights reserved.
//

import UIKit

class ZJYBaseViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    var navigationBarHide:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(self.navigationBarHide, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        if ((self.navigationController?.visibleViewController?.isKind(of: ZJYBaseViewController.self))!) {
//            let vc = self.navigationController?.visibleViewController as! ZJYBaseViewController
//            self.navigationController?.setNavigationBarHidden(vc.navigationBarHide, animated: animated)
//        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
//    deinit {
//        print("---\(self.className())---释放---")
//    }
    
    //MARK: - Public
    
    //MARK: - Private
    
    //MARK: - Procotol
    
    

}
