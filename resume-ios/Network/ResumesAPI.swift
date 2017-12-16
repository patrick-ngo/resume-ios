//
//  ResumesAPI.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Alamofire



typealias JSONCompletionBlock = ( [String:Any]? ,_ error: Error?) -> Void
typealias DataCompletionBlock = ( Data? ,_ error: Error?) -> Void

class ResumesAPI
{
    static let BASE_URL = "https://resumes-node.herokuapp.com/api/"
    
    static let shared = ResumesAPI()
    
    //MARK: - API methods -
    
    //Get all resumes
    class func getResumes(page: Int = 1, completionHandler: @escaping DataCompletionBlock) {
        
        let endPoint = "resumes/"
        let url = URL(string: "\(ResumesAPI.BASE_URL)\(endPoint)")!
        
        let parameters: Parameters = ["page":page]
        
        Alamofire.request(url, parameters: parameters).responseJSON { response in
            
            completionHandler(response.data, response.error)
        }
    }
    
    //Get single resume
    class func getResume(by id:Int, completionHandler: @escaping DataCompletionBlock) {
        let endPoint = "resumes/\(id)"
        let url = URL(string: "\(ResumesAPI.BASE_URL)\(endPoint)")!
        
        let parameters: Parameters = [:]
        
        Alamofire.request(url, parameters: parameters).responseJSON { response in
            
            completionHandler(response.data, response.error)
        }
    }
}
