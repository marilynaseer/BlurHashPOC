//
//  MockAnalytics.swift
//  BlurhashPOCTests
//
//  Created by marilyn A on 7/1/21.
//

import XCTest
@testable import BlurhashPOC

class MockAnalytics : AnalyticsProtocol {
   
    var events: [AnalyticsEvent] = []
    
    func trackEvent(_ event: AnalyticsEvent) {
        // we are simulating the process of even being sent to the respective analytics tool
        // we are only storing in an array here to mock it
        events.append(event)
        
    }
    
}
