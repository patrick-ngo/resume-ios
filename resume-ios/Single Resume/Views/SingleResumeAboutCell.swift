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
    
    let descriptionLabel : UILabel = {
        let lbl = UILabel()
        
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textAlignment = .left
        lbl.numberOfLines = 4
        lbl.lineBreakMode = .byTruncatingTail
        lbl.text = "Description"
        
        return lbl
    }()
    
    
    lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.text = "Title"
        return lbl
    }()
    
    lazy var readMoreButton : UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.titleLabel?.textAlignment = .center
        btn.setTitle("Read More", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        
        btn.backgroundColor = UIColor.cyan

        
        return btn
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor.white
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.readMoreButton)
        
        
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

