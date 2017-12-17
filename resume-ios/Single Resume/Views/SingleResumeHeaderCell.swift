//
//  SingleResumeHeaderCell.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import SnapKit
import SDWebImage

class SingleResumeHeaderCell : UITableViewCell {
    
    
    var resume: ResumeModel? = nil {
        didSet{
            if let resume = self.resume {
                
                if let bannerUrl = resume.bannerImage {
                    self.bannerImageView.sd_setImage(with: URL(string: bannerUrl))
                }
                
                if let profileUrl = resume.profileImage {
                    self.avatarImageView.sd_setImage(with: URL(string: profileUrl))
                }
                
                if let name = resume.name {
                    self.nameLabel.text = name
                }
                
                if let title = resume.title {
                    self.titleLabel.text = title
                }
                
                if let education = resume.education {
                    self.educationLabel.text = education
                }
                
                if let location = resume.location {
                    self.locationLabel.text = location
                }
            }
            
        }
    }

    
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
        
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 3
        
        return iv
    }()
    
    let containerView : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 2
        return v
    }()
    
    lazy var nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textColor = UIColor.Text.darkGrey
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.text = "Name"
        return lbl
    }()
    
    lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        lbl.textColor = UIColor.Text.darkGrey
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.text = "Title"
        return lbl
    }()
    
    lazy var educationLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = UIColor.Text.darkGrey
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.text = "Education"
        return lbl
    }()
    
    lazy var locationLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = UIColor.Text.darkGrey
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
        self.backgroundColor = .clear
        
        self.contentView.addSubview(self.bannerImageView)
        self.contentView.addSubview(self.containerView)
        self.contentView.addSubview(self.avatarImageView)
        
        self.containerView.addSubview(self.nameLabel)
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.educationLabel)
        self.containerView.addSubview(self.locationLabel)
        
        self.bannerImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(100)
            make.top.equalTo(0)
        }
        
        self.containerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bannerImageView.snp.bottom).offset(-5)
            make.left.equalTo(6)
            make.right.equalTo(-6)
            make.bottom.equalTo(-6)
        }
        
        self.avatarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0).offset(20)
            make.height.width.equalTo(100)
            make.centerX.equalTo(self.contentView.snp.centerX)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.avatarImageView.snp.bottom).offset(5)
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
            make.bottom.equalTo(0).offset(-10)
        }
    }
}
