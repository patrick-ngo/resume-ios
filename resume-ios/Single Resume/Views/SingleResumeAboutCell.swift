//
//  SingleResumeAboutCell.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit

class SingleResumeAboutCell : UITableViewCell {
    
    var resume: ResumeModel? = nil {
        didSet{
            if let resume = self.resume {

                if let summary = resume.summary {
                    self.descriptionLabel.text = summary
                }
            }
        }
    }
    
    let containerView : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        
        v.clipsToBounds = true
        v.layer.cornerRadius = 2
        return v
    }()
    
    
    let descriptionLabel : UILabel = {
        let lbl = UILabel()
        
        lbl.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byTruncatingTail
        lbl.text = "Description"
        
        return lbl
    }()
    
    
    lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.text = "About"
        return lbl
    }()
    
    lazy var readMoreButton : UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.titleLabel?.textAlignment = .center
        btn.setTitle("Read More", for: .normal)
        btn.setTitleColor(UIColor.Button.blue, for: .normal)
        
        btn.addTopBorder(with: UIColor.Border.around, width: 1.0)

        
        return btn
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = .clear
        
        self.contentView.addSubview(self.containerView)
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.descriptionLabel)
        self.containerView.addSubview(self.readMoreButton)
        
        self.containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(0).inset(UIEdgeInsetsMake(0, 6, 6, 6))
        }
        
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0).offset(15)
            make.right.equalTo(0).offset(-15)
            make.top.equalTo(0).offset(5)
            make.height.equalTo(35)
        }
        
        self.descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0).offset(15)
            make.right.equalTo(0).offset(-15)
            make.top.equalTo(self.titleLabel.snp.bottom)
        }
        
        self.readMoreButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(10)
            make.bottom.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(40)
        }
    }
}

