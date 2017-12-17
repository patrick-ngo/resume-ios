//
//  SingleResumeSectionHeaderView.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit

class SingleResumeSectionHeaderView: UITableViewHeaderFooterView {
    
    let containerView : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        
        //only round 2 top corners
        v.layer.cornerRadius = 2
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return v
    }()
    
    lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        lbl.textColor = UIColor.Text.darkGrey
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()

    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier:reuseIdentifier)
        
        self.backgroundColor = .clear
        
        self.contentView.addSubview(self.containerView)
        self.containerView.addSubview(self.titleLabel)
        
        self.containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(0).inset(UIEdgeInsets(top: 6, left: 6, bottom: 0, right: 6))
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-10)
            make.bottom.equalTo(0)
            make.top.equalTo(10)
        }
    }
    
    override func prepareForReuse() {
       super.prepareForReuse()
    }

}
