//
//  EducationModel.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation

//Education
struct EducationModel: Decodable {
    let id: Int?
    
    //basic info
    let title: String?
    let school: String?
    let start: String?
    let end:String?
    let period:String?
    let location: String?
    let description: String?
    let current: Bool?
    
    //image
    let imageUrl: String?
    
    //id of resume if belongs to
    let resumeId: Int?
}
