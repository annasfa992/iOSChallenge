//
//  iOSChallengeUITests.swift
//  iOSChallengeUITests
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import XCTest
import UIKit

class iOSChallengeUITests: XCTestCase {
    
     var app: XCUIApplication!

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
      
  app = XCUIApplication()
//     app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    
    
    
    
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    func testTableInteraction() {
    app.launch()
     
        // Assert that we are displaying the tableview
        let articleTableView = app.tables["MostPopulerTableView"]
     
        XCTAssertTrue(articleTableView.exists, "The article tableview exists")
     
        // Get an array of cells
        let tableCells = articleTableView.cells
        if tableCells.count > 0 {
              let count: Int = (tableCells.count - 1)
           
              let promise = expectation(description: "Wait for table cells")
           
              for i in stride(from: 0, to: count , by: 1) {
                  // Grab the first cell and verify that it exists and tap it
                  let tableCell = tableCells.element(boundBy: i)
                  XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                  // Does this actually take us to the next screen
                  tableCell.tap()
           
                  if i == (count - 1) {
                      promise.fulfill()
                  }
                  // Back
              app.navigationBars.buttons.element(boundBy: 0).tap()
              }
              waitForExpectations(timeout: 30, handler: nil)
              XCTAssertTrue(true, "Finished validating the table cells")
           
          } else {
              XCTAssert(false, "Was not able to find any table cells")
          }
      
    }
    

    
    

    
}
