//
//  ErrorModel.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import Foundation

class ErrorModel: Error {
    
    // MARK: - Properties
    var errorKey: Int
    var message: String
    
    init(_ ErrorKey: Int , _ Message : String ) {
        self.errorKey = ErrorKey
        self.message = Message
    }
}

// MARK: - Public Functions
extension ErrorModel {
    
    
    
    
    class func errorMessage(ErrorCode : Int , ErrorMessage : String) -> ErrorModel{
        
        return ErrorModel(ErrorCode,ErrorMessage)
    }
}





