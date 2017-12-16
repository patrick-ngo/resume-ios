//
//  JobModel.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation

//Job
struct JobModel: Decodable {
    let id: Int?
    let title: String?
    let company: String?
    let start: String?
    let end:String?
    
    let location: String?
    let description: String?
    let current: Bool?
    
    let resumeId: Int?
}

