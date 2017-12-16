//
//  ResumeModel.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation

//Resume
struct ResumeModel: Decodable {
    let id: Int?
    let name: String?
    
    let profileImage: String?
    let bannerImage: String?
    
    let title: String?
    let education: String?
    let location: String?
    let summary: String?
    
    let jobs: [JobModel]?
}

