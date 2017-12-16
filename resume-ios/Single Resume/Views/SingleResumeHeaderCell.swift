//
//  SingleResumeHeaderCell.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import SnapKit

class SingleResumeHeaderCell : UITableViewCell {

    
    let bannerImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let avatarImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 50 //size 80
        iv.backgroundColor = .green
        
        return iv
    }()
    
    let containerView : UIView = {
        let v = UIView()
        v.backgroundColor = .gray
        return v
    }()
    
    lazy var nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.text = "Name"
        return lbl
    }()
    
    lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.text = "Title"
        return lbl
    }()
    
    lazy var educationLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.text = "Education"
        return lbl
    }()
    
    lazy var locationLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.text = "Location"
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.bannerImageView)
        self.contentView.addSubview(self.containerView)
        self.contentView.addSubview(self.avatarImageView)
        
        self.containerView.addSubview(self.nameLabel)
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.educationLabel)
        self.containerView.addSubview(self.locationLabel)
        
        self.bannerImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(80)
            make.top.equalTo(0)
            make.bottom.equalTo(self.containerView.snp.top)
        }
        
        self.containerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bannerImageView.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(150)
            make.bottom.equalTo(0)
        }
        
        self.avatarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0).offset(20)
            make.height.width.equalTo(100)
            make.centerX.equalTo(self.contentView.snp.centerX)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.avatarImageView.snp.bottom).offset(15)
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.height.equalTo(30)
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(0)
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.height.equalTo(20)
        }
        
        self.educationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(0)
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.height.equalTo(15)
        }
        
        self.locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.educationLabel.snp.bottom).offset(0)
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.height.equalTo(15)
            make.bottom.equalTo(0).offset(-15)
        }
    }
}
