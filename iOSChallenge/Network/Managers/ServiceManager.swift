//
//  ServiceManager.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//


import Foundation
import UIKit

class ServiceManager  {
    
    // MARK: - Properties
    public static let shared: ServiceManager = ServiceManager()
    
    public var baseURL: String = Constants.URLConstants.BaseURL
}

// MARK: - Public Functions
extension ServiceManager {
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Swift.Result<T, ErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            LogManager.req(request)
        }
        
        /// Comment for rest service
    //    let data = try! Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Response", ofType: "json")!), options: NSData.ReadingOptions.mappedIfSafe)
        
        /// Uncomment for rest service
      URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
      guard let data = data, var responseModel = try? JSONDecoder().decode(ResponseModel<T>.self, from: data) else {
     //   guard var responseModel = try? JSONDecoder().decode(ResponseModel<T>.self, from: data!) else {
        let error: ErrorModel = ErrorModel(500, "")
                LogManager.err(error)

                completion(Result.failure(error))
                return
            }
           let statusCode = ((response as? HTTPURLResponse) != nil) ? (response as! HTTPURLResponse).statusCode :500
        
        
        
            responseModel.request = request

            if request.isLoggingEnabled.1 {
                LogManager.res(responseModel)
            }
        
        print("responseModel.status ----->\(statusCode)")
        if statusCode == 200 || statusCode == 201 , let data = responseModel.results {
                completion(Result.success(data))
            }
        
        else if statusCode == 401{
              DispatchQueue.main.async {
            
            
        }
        
        }
        
       else {
            completion(Result.failure(ErrorModel.errorMessage(ErrorCode: statusCode, ErrorMessage: responseModel.status)))
            }

        /// Uncomment for rest service
       }.resume()
    }
}

