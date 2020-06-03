//
//  iOSChallengeTests.swift
//  iOSChallengeTests
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import XCTest
@testable import iOSChallenge

class iOSChallengeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    

 
    
    func testMostPopulerApi() {
      let ex = expectation(description: "Expecting a JSON data not nil")

            MostPopulerService.getAll(completion: { result in
          switch result {
          case Result.success(let response):
              
              XCTAssert(true)
              print(response)
               XCTAssertNotNil(response)
             ex.fulfill()
               
              // Handle successfull response
            
              break
          case Result.failure(let error):
          XCTAssertNil(error)
          ex.fulfill()
        
              // Handle error
              break
          }
          
        
      }
          
          
      )

       
      waitForExpectations(timeout: 10) { (error) in
        if let error = error {
          XCTFail("error: \(error)")
        }
      }
    }


}
