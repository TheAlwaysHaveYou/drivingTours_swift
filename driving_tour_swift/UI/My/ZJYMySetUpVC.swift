//
//  ZJYMySetUpVC.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/27.
//  Copyright © 2019年 FKD. All rights reserved.
//

import UIKit

class ZJYMySetUpVC: ZJYBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    
    var tableView = UITableView()
    let titleArr:[[String]] = [["更换手机号","修改登录密码"],["意见反馈","用户协议","关于","版本号"]]
    let describeArr:[[String]] = [["未获取到",""],["","","","V"+app_Version]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
    func setupUI() -> () {
        self.tableView = UITableView.init(frame: CGRect(x: 0, y: kNavBarHeight, width: kSCREEN_WIDTH, height: KSCREEN_HEIGHT-kNavBarHeight), style: .grouped)
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorColor = color_grayLine
        self.tableView.separatorInset = .zero
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
    
        self.view.addSubview(self.tableView)
    }
    //MARK: - Procotol
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArr[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier:String = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if (cell == nil) {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: identifier)
            cell?.textLabel?.font = FitFont(x: normal_bigerFont)
            cell?.textLabel?.textColor = color_blackText
            cell?.detailTextLabel?.font = FitFont(x: normal_bigerFont)
            cell?.detailTextLabel?.textColor = color_blackText
            cell?.selectionStyle = .none
            cell?.accessoryType = .disclosureIndicator
        }
        if indexPath.row == 1 && indexPath.row == 3 {
            cell?.accessoryType = .none
        }
        
        cell?.textLabel!.text = self.titleArr[indexPath.section][indexPath.row]
        cell?.detailTextLabel?.text = self.describeArr[indexPath.section][indexPath.row]
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
