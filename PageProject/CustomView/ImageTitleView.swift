//
//  ImageTitleView.swift
//  PageProject
//
//  Created by 梦里都是梦 on 2018/9/13.
//  Copyright © 2018年 梦里都是梦. All rights reserved.
//

import UIKit
import SnapKit
class ImageTitleView: UIView {
    
   // 标题内容
   var titleText:String {
        set {

            titleLb.text = newValue
        } get {
            return titleLb.text!
        }
    }
    // 比例显示
    var descText:String {
        set {
            
           descLb.text = newValue
        } get {
            return descLb.text!
        }
    }
    // 显示图片
    var showImage:UIImage {
        set {
            imageView.image = newValue
        } get {
            return imageView.image!
        }
    }
    // 蒙层比例
    var proportion:CGFloat {
        set {
            proportionNum = newValue
            if proportionNum < 0.05 {
                proportionNum += 0.02
            }
            if proportionNum > 1 {
               proportionNum = 1
            }
            if proportionNum < 0  {
                proportionNum = 0
            }
            self.layoutIfNeeded()
        } get {
            return  proportionNum
        }
    }
    
    
    private var imageView = UIImageView()
    private var titleLb = UILabel()
    private var descLb = UILabel()
    private var imageLayer = CAShapeLayer()
    private var proportionNum:CGFloat = 0.00
    
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.viewSetting()
    }
    
    private func viewSetting() {
        self.addSubview(imageView)
        self.addSubview(titleLb)
        imageView.image = UIImage.init(named: "dict_unitdo")
        titleLb.text = "Title";
        titleLb.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        titleLb.textColor =  UIColor.black
        titleLb.textAlignment = NSTextAlignment.center
        descLb.textColor = UIColor.black
        descLb.text = "desc"
        descLb.textAlignment = NSTextAlignment.center
        descLb.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        descLb.textColor = UIColor.black.withAlphaComponent(0.5)
        self.addSubview(descLb)
        descLb.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
            make.height.greaterThanOrEqualTo(10)
        }
        titleLb.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(descLb.snp.top).offset(-5)
            make.height.greaterThanOrEqualTo(15)
        }
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalTo(titleLb.snp.top).offset(-5)
            make.centerX.equalToSuperview()
            make.width.equalTo(imageView.snp.height)
        }
        
        imageView.layer.addSublayer(imageLayer)
        imageLayer.frame = CGRect.zero
        imageLayer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        self.imageView.layer.addSublayer(imageLayer)
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageViewFrame = imageView.frame
        imageLayer.frame = CGRect.init(x: 0, y: 0, width: imageViewFrame.size.width, height: imageViewFrame.size.height * (1 - proportionNum))
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
