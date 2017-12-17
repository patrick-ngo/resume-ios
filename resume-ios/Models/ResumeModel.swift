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
    
    //basic info
    let name: String?
    let title: String?
    let education: String?
    let location: String?
    let summary: String?
    
    //images
    let profileImage: String?
    let bannerImage: String?
    
    //contact info
    let contactSummary: String?
    let contactNumber: String?
    let email: String?
    
    //jobs
    let jobs: [JobModel]?
    
    //educations
    let educations: [EducationModel]?
}

