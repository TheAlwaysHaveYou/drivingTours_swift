//
//  ZJYMyVC.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/26.
//  Copyright © 2019年 FKD. All rights reserved.
//

import UIKit

class ZJYMyVC: ZJYBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    var headerView = ZJYMyHeaderView()
    
    var tableView = UITableView()
    let titleArr = ["邀请好友","联系客服","设置"]
    let imageArr = ["icon_yaoqinghaoyou","icon_lianxikefu","icon_shezhi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBarHide = true
        
        self.setupUI()
        
        HTTPRequestManager.postRequest(url: "http://118.190.206.2:19089/organization/queryValidThemeList", params: nil) { (response, result) in
            
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
    func setupUI() -> () {
        self.headerView = ZJYMyHeaderView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: 0))
        
        weak var weakSelf = self
        self.headerView.selectedBlack { (tag) in
            if tag == 0 {//钱包
                
            }else if tag == 1 {//收藏
                let vc = ZJYMyCollectionVC()
                vc.hidesBottomBarWhenPushed = true
                weakSelf?.navigationController?.pushViewController(vc, animated: true)
            }else if tag == 2 {//开票
                
            }else if tag == 100 {//个人中心
                let vc = ZJYMyPersonInfoVC()
                vc.hidesBottomBarWhenPushed = true
                weakSelf?.navigationController?.pushViewController(vc, animated: true)
            }else if tag == 200 {//vip
                let vc = ZJYMyVipCenterVC()
                vc.hidesBottomBarWhenPushed = true
                weakSelf?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        self.tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: KSCREEN_HEIGHT-kTabBarHeight), style: .grouped)
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorColor = color_grayLine
        self.tableView.separatorInset = .zero
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        self.tableView.tableHeaderView = self.headerView
        self.view.addSubview(self.tableView)
    }
    
    //MARK: - Procotol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if (cell == nil) {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: identifier)
            cell?.textLabel?.font = FitFont(x: normal_bigerFont)
            cell?.textLabel?.textColor = color_blackText
            cell?.detailTextLabel?.font = FitFont(x: normal_font)
            cell?.detailTextLabel?.textColor = color_grayText
            cell?.selectionStyle = .none
            cell?.accessoryType = .disclosureIndicator
        }
        cell?.textLabel?.text = self.titleArr[indexPath.row]
        cell?.imageView?.image = IMGNAME(tip: self.imageArr[indexPath.row])
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }else if indexPath.row == 1 {
            
        }else if indexPath.row == 2 {
            let vc = ZJYMySetUpVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.headerView.scrollViewOffSet = scrollView.contentOffset.y
    }
    
}
