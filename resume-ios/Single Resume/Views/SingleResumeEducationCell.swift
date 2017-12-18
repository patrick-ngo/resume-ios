//
//  SingleResumeEducationCell.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit


class SingleResumeEducationCell: UITableViewCell {
    
    var education:EducationModel? {
        didSet {
            if let education = self.education {
                
                if let imageUrl = education.imageUrl {
                    self.schoolImageView.sd_setImage(with: URL(string: imageUrl))
                }

                if let school = education.school {
                    self.schoolLabel.text = school
                }
                
                if let degree = education.degree {
                    self.degreeLabel.text = degree
                }
                
                if let major = education.title {
                    self.degreeLabel.text = self.degreeLabel.text! + ", \(major)"
                }
                
                if let start = education.start {
                    self.periodLabel.text = start
                }
                
                if let end = education.end {
                    self.periodLabel.text = self.periodLabel.text! + " - \(end)"
                }
            }
        }
    }
    
    //MARK: - Views -
    
    let containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    let schoolImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 2
        
        return iv
    }()
    
    let schoolLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.Text.darkGrey
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return lbl
    }()
    
    let degreeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.Text.altGrey
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let periodLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.Text.altGrey
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.numberOfLines = 0
        lbl.text = ""
        return lbl
    }()
    
    
    //MARK: - Init -
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.backgroundColor = UIColor.Background.grey
        
        self.containerView.addSubview(self.schoolImageView)
        self.containerView.addSubview(self.schoolLabel)
        self.containerView.addSubview(self.degreeLabel)
        self.containerView.addSubview(self.periodLabel)
        
        self.contentView.addSubview(containerView)
        
        self.containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(0).inset(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6))
        }
        
        
        self.schoolImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0).offset(10)
            make.left.equalTo(15)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.bottom.equalTo(-10)
        }
        
        self.schoolLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.schoolImageView).offset(5)
            make.left.equalTo(self.schoolImageView.snp.right).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
        }
        
        self.degreeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.schoolLabel)
            make.top.equalTo(self.schoolLabel.snp.bottom).offset(3)
            make.right.equalTo(self.contentView).offset(-10)
        }
        
        self.periodLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.schoolLabel)
            make.top.equalTo(self.degreeLabel.snp.bottom).offset(3)
            make.right.equalTo(self.contentView).offset(-10)
        }
        
        self.contentView.addBottomBorder(with: UIColor.Border.around, width: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

