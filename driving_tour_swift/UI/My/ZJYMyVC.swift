//
//  ZJYMyVC.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/26.
//  Copyright © 2019年 FKD. All rights reserved.
//

import UIKit

class ZJYMyVC: ZJYBaseViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBarHide = true
        
        self.setupUI()
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
    func setupUI() -> () {
        let btn = UIButton.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(gogogogog), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    @objc func gogogogog() -> () {
        let vc = ZJYMySetUpVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Procotol
    
  
    
}
