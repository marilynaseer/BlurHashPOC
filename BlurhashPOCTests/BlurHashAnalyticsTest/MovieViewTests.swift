//
//  MovieViewTests.swift
//  BlurhashPOCTests
//
//  Created by marilyn A on 7/1/21.
//

import XCTest
@testable import BlurhashPOC

class MovieViewTests: XCTestCase {
    
    var analytics : MockAnalytics!
    var viewModel : MovieViewModel!

    override func setUpWithError() throws {
        self.analytics = MockAnalytics()
        self.viewModel = MovieViewModel(analytics: analytics) //can have other data to set up the view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_analytics_movieTapped() throws {
        //When user taps on movie at index 2
        viewModel.selectMovie(at: 2)
        
        // Then 'movie_tapped' analytics event should be sent
        let event = try XCTUnwrap(analytics.events.first)
        XCTAssertEqual(event.name, "movie_tapped")
        XCTAssertEqual(event.payload["movie_id"] as? Int, 3)
        XCTAssertEqual(event.payload["movie_index"] as? Int, 2)
    }

}

extension AnalyticsEvent{
    func assertName(_ name: String, file: StaticString = #file, line: Int = #line) {
        XCTAssertEqual(self.name, name)
      }
      
      func assertPayload<T: Equatable>(key: String, equalsTo value: T) {
        XCTAssertEqual(self.payload[key] as? T, value)
      }
}
