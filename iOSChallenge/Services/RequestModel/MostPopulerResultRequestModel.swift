//
//  MostPopulerResultRequestModel.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import Foundation

class MostPopulerResultRequestModel: RequestModel {
    
    // MARK: - Properties

    
    
 

    
    
    override init() {
       
    
    }
    
    override var path: String {
        return Constants.URLConstants.mostpopular
    }
    

    
    
    
    override var method: RequestHTTPMethod {
        return .get
      }
    

}
