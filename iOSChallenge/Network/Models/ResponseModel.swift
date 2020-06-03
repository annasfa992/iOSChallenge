//
//  ResponseModel.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import Foundation
struct ResponseModel<T: Codable>: Codable {
    
    // MARK: - Properties

    
    var status : String
    var copyright : String
    var numResults : Int
    var results: T?
    
    
       var request: RequestModel?
    
    
    public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        status = (try? keyedContainer.decode(String.self, forKey: CodingKeys.status)) ?? ""
        copyright = (try? keyedContainer.decode(String.self, forKey: CodingKeys.copyright)) ?? ""
        numResults = (try? keyedContainer.decode(Int.self, forKey: CodingKeys.numResults)) ?? 0
        results = try? keyedContainer.decode(T.self, forKey: CodingKeys.results)
    }
}

// MARK: - Private Functions
extension ResponseModel {
    
    private enum CodingKeys: String, CodingKey {
        

        case status = "status"
        case copyright = "copyright"
        case numResults = "num_results"
        case results = "results"
        
    }
}

