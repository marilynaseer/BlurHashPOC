//
//  BlurhashPOCUITests.swift
//  BlurhashPOCUITests
//
//  Created by marilyn A on 6/17/21.
//

import XCTest

class BlurhashPOCUITests: XCTestCase {

    var app : XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testGameStyleSwitch(){
               
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
