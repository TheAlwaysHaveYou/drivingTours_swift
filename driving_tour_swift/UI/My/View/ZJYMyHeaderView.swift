//
//  ZJYMyHeaderView.swift
//  driving_tour_swift
//
//  Created by 范魁东 on 2019/3/29.
//  Copyright © 2019 FKD. All rights reserved.
//

import UIKit

class ZJYMyHeaderView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    var callBack : swiftIntBlock?
    
    var bgImgV = UIImageView()
    var infoView = UIView()
    var headImgV = UIImageView()
    var arrowImgV = UIButton()
    var nameLabel = UILabel()
    var vipImgV = UIImageView()
    var vipLabel = UILabel()
    var signLabel  = UILabel()
    var loginLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        
        self.bgImgV = UIImageView.init(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width*(220.0/360)))
        self.bgImgV.contentMode = .scaleAspectFill
        
        self.infoView = UIView.init(frame: CGRect(x: FITSCALE(number: 15), y: self.bgImgV.height/2, width: frame.size.width-FITSCALE(number: 15)*2, height: FITSCALE(number: 140)))
        self.infoView.backgroundColor = UIColor.white
        self.infoView.layer.cornerRadius = 2
        self.infoView.layer.shadowRadius = 4
        self.infoView.layer.shadowColor = color_grayLine.cgColor
        self.infoView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.infoView.layer.shadowOpacity = 1
        
        self.headImgV = UIImageView.init(frame: CGRect(x: FITSCALE(number: 20), y: FITSCALE(number: 30), width: FITSCALE(number: 80), height: FITSCALE(number: 80)))
        self.headImgV.backgroundColor = color_grayText
        self.headImgV.contentMode = .scaleAspectFill
        self.headImgV.layer.masksToBounds = true
        self.headImgV.layer.cornerRadius = self.headImgV.height/2
        
        
        self.arrowImgV = UIButton.init(frame: CGRect(x: 0, y: 0, width: 6, height: 12))
        self.arrowImgV.right = self.infoView.width-FITSCALE(number: 15)
        self.arrowImgV.centerY = self.headImgV.centerY
        self.arrowImgV.setImage(IMGNAME(tip: "右箭头"), for: .normal)
        
        self.nameLabel = UILabel.init()
        self.nameLabel.font = FitBorderFont(x: big_font)
        self.nameLabel.textColor = color_blackText
        self.nameLabel.isUserInteractionEnabled = true
        self.nameLabel.isHidden = true
        
        self.vipImgV = UIImageView.init()
        self.vipImgV.isUserInteractionEnabled = true
        self.vipImgV.isHidden = true
        
        self.vipLabel = UILabel.init()
        self.vipLabel.font = FitFont(x: normal_font)
        self.vipLabel.textColor = color_white
        
        self.signLabel = UILabel.init()
        self.signLabel.font = FitFont(x: normal_bigerFont)
        self.signLabel.textColor = color_grayText
        
        
        let tempWidth = self.infoView.width-10-self.arrowImgV.width-self.headImgV.right-FITSCALE(number: 10)-FITSCALE(number: 10)
        let tempHeight = self.infoView.height
        self.loginLabel = UILabel.init(frame: CGRect(x: self.headImgV.right+FITSCALE(number: 10), y: 0, width:tempWidth , height:tempHeight))
        self.loginLabel.font = FitBorderFont(x: big_font)
        self.loginLabel.textColor = color_blackText
        self.loginLabel.text = "登录/注册"
        self.loginLabel.backgroundColor = .white
        
        self.vipImgV.addSubview(self.vipLabel)
        self.infoView.addSubview(self.headImgV)
        self.infoView.addSubview(self.arrowImgV)
        self.infoView.addSubview(self.nameLabel)
        self.infoView.addSubview(self.signLabel)
        self.infoView.addSubview(self.loginLabel)
        self.infoView.addSubview(self.vipImgV)
        
        let infoTap = UITapGestureRecognizer.init(target: self, action: #selector(infoTapGestureClick(tap:)))
        self.infoView.addGestureRecognizer(infoTap)
        
        let vipTap = UITapGestureRecognizer.init(target: self, action: #selector(vipTapGestureClick(tap:)))
        self.vipImgV.addGestureRecognizer(vipTap)
        
        self.nameLabel.text = "我的名字"
        self.headImgV.image = IMGNAME(tip: "头像占位")
        self.bgImgV.image = IMGNAME(tip: "icon_beijing")
        
        self.addSubview(self.bgImgV)
        self.addSubview(self.infoView)
        
        let nameArr = ["钱包","收藏","开票"]
        let imageArr = ["icon_wodeqianabao","icon_shoucang","icon_shenqingkaipiao"]
        for i in 0..<nameArr.count {
            let btn = UIButton.init(frame: CGRect(x: frame.size.width/3*CGFloat(i), y: self.infoView.bottom+5, width: frame.size.width/3, height: (FITSCALE(number: 45))*1.5))
            btn.setTitleColor(color_blackText, for: .normal)
            btn.titleLabel?.font = FitFont(x: normal_bigerFont)
            btn.setTitle(nameArr[i], for: .normal)
            btn.setImage(IMGNAME(tip: imageArr[i]), for: .normal)
            btn.tag = i;
            btn.setImageDirection(direction: .top, span: 8)
            btn.addTarget(self, action: #selector(functionButtonClick(sender:)), for: .touchUpInside)
            self.addSubview(btn)
            
            if (i==nameArr.count-1) {
                self.height = btn.bottom
            }
        }
    }
    
    @objc func infoTapGestureClick(tap:UIGestureRecognizer) -> () {
        if callBack != nil {
            callBack!(100)
        }
    }
    
    @objc func vipTapGestureClick(tap:UIGestureRecognizer) -> () {
        if callBack != nil {
            callBack!(200)
        }
    }
    
    @objc func functionButtonClick(sender:UIButton) -> () {
        if callBack != nil {
            callBack!(sender.tag)
        }
    }
    
    open func selectedBlack(block:@escaping swiftIntBlock) -> () {
        callBack = block
    }
    
    var personInfoModel: ZJYPersonalInfoModel? {
        didSet {
            if personInfoModel == nil {
                self.loginLabel.isHidden = false
                self.vipImgV.isHidden = true
                self.nameLabel.isHidden = true
                self.headImgV.image = IMGNAME(tip: "头像占位")
            }else {
                
            }
        }
    }
    
    
    
}
