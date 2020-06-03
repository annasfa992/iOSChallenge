//
//  BaseResponse.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//


import Foundation


class BaseResponse : Decodable {
    
    
    var status =  String()
    var copyright =  String()
    var numResults =  Int()

    

    
    
    
    enum CodingKeys: String, CodingKey {
          
        
        
        case status = "status"
        case copyright = "copyright"
        case numResults = "num_results"
       
    
    }
}
