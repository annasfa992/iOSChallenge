//
//  MostPopulerService.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import Foundation
import Foundation
class MostPopulerService {
    
    
    class func getAll( completion: @escaping(Swift.Result<[MostPopulerResultResponseModel], ErrorModel>) -> Void) {
        ServiceManager.shared.sendRequest(request: MostPopulerResultRequestModel()) { (result) in
            completion(result)
        }
    }
    


}
