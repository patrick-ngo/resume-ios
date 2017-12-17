//
//  SingleResumeContactCell.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit

class SingleResumeContactCell : UITableViewCell {
    
    let containerView : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        
        v.clipsToBounds = true
        v.layer.cornerRadius = 2
        return v
    }()
    
    let descriptionTextView : UITextView = {
        let tv = UITextView()
        tv.isScrollEnabled = false
        tv.isEditable = false
        
        tv.font = UIFont.systemFont(ofSize: 12)
        tv.textColor = UIColor.Text.altGrey
        tv.textAlignment = .left
        tv.tintColor = UIColor.Button.lightBlue
        
        //enable detectors (url, phone number, etc)
        tv.dataDetectorTypes = .all
        
        tv.textContainer.maximumNumberOfLines = 4
        tv.textContainer.lineBreakMode = .byTruncatingTail
//        tv.textContainerInset = UIEdgeInsets.zero
        tv.textContainer.lineFragmentPadding = 0
        
        tv.text =  """
                    LinkedIn:       linkedin.com/in/patngo/
                    GitHub:         github.com/sauceypan
                    Email:            patrick.ngo@hotmail.com
                    Mobile:         +6582209567
                    """
        
        
        return tv
    }()
    
    
    lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        lbl.textColor = UIColor.Text.darkGrey
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.text = "Contact"
        
        return lbl
    }()
    
    lazy var emailButton : UIButton = {
        let btn = UIButton()
        let image = #imageLiteral(resourceName: "email").withRenderingMode(.alwaysTemplate)
        btn.setImage(image, for: .normal)
        btn.setTitle("Email", for: .normal)
        btn.setTitleColor(UIColor.Button.lightBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        btn.imageView?.tintColor = UIColor.Button.lightBlue
        btn.addRightBorder(with: UIColor.Border.around, width: 1)
        btn.addTopBorder(with: UIColor.Border.around, width: 1)
        
        var spacing:CGFloat = 10; // the amount of spacing to appear between image and title
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
        
        return btn
    }()
    
    lazy var phoneButton : UIButton = {
        let btn = UIButton()
        let image = #imageLiteral(resourceName: "phone").withRenderingMode(.alwaysTemplate)
        btn.setTitle("Call", for: .normal)
        btn.setTitleColor(UIColor.Button.lightBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        btn.setImage(image, for: .normal)
        btn.imageView?.tintColor = UIColor.Button.lightBlue
        btn.addTopBorder(with: UIColor.Border.around, width: 1)
        
        var spacing:CGFloat = 10; // the amount of spacing to appear between image and title
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
        
        return btn
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        //border around cell
        self.contentView.layer.borderColor = UIColor.Border.around.cgColor
        self.contentView.layer.borderWidth = 1
        
        self.contentView.addSubview(self.containerView)
        
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.descriptionTextView)
        self.containerView.addSubview(self.emailButton)
        self.containerView.addSubview(self.phoneButton)
        
        self.containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(0).inset(UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0).offset(12)
            make.right.equalTo(0).offset(-6)
            make.top.equalTo(self.contentView).offset(5)
            make.height.equalTo(35)
        }
        
        self.descriptionTextView.snp.makeConstraints { (make) in
            make.left.equalTo(0).offset(12)
            make.right.equalTo(0).offset(-6)
            make.top.equalTo(self.titleLabel.snp.bottom)
        }
        
        self.emailButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.descriptionTextView.snp.bottom).offset(10)
            make.bottom.equalTo(0)
            make.right.equalTo(self.contentView.snp.centerX).offset(1)
            make.left.equalTo(0)
            make.height.equalTo(50)
        }
        
        self.phoneButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.emailButton.snp.top)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
            make.left.equalTo(self.contentView.snp.centerX).offset(0)   //offset by 1 to avoid double border of the email and phone buttons
            make.height.equalTo(50)
        }
        
    }
    
}
