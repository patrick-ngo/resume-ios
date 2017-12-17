//
//  SingleResumeJobCell.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit

class SingleResumeJobCellCell: UITableViewCell {
    
    var job:JobModel? {
        didSet {
            if let job = self.job {
                
                if let imageUrl = job.imageUrl {
                    self.companyImageView.sd_setImage(with: URL(string: imageUrl))
                }
                
                if let title = job.title {
                    self.titleLabel.text = title
                }
                
                if let company = job.company {
                    self.companyLabel.text = company
                }
                
//                if let start = job.start {
//                    self.periodLabel.text = start
//                }
//
//                if let end = job.end {
//                    self.periodLabel.text = self.periodLabel.text! + " - \(end)"
//                }
                
                if let period = job.period {
                    self.periodLabel.text = period
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
    
    let companyImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 2
        
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.Text.darkGrey
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    let companyLabel: UILabel = {
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
        
        self.containerView.addSubview(self.companyImageView)
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.companyLabel)
        self.containerView.addSubview(self.periodLabel)
        
        self.contentView.addSubview(containerView)
        
        self.containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(0).inset(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6))
        }
        
        
        self.companyImageView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(100)
            make.height.equalTo(65)
            make.bottom.equalTo(-5)
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.companyImageView).offset(5)
            make.left.equalTo(self.companyImageView.snp.right).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
        }
        
        self.companyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(4)
            make.right.equalTo(self.contentView).offset(-10)
        }
        
        self.periodLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel)
            make.top.equalTo(self.companyLabel.snp.bottom).offset(4)
            make.right.equalTo(self.contentView).offset(-10)
        }
        
        self.contentView.addBottomBorder(with: UIColor.Border.around, width: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
