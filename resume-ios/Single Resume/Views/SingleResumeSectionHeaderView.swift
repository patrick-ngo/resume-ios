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
        
        self.contentView.backgroundColor = UIColor.Background.grey
        
        self.contentView.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(21)
            make.right.equalTo(-10)
            make.bottom.top.equalTo(0)
        }
    }
    
    override func prepareForReuse() {
       super.prepareForReuse()
    }

}
