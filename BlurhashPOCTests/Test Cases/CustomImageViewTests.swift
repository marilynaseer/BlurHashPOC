//
//  CustomImageViewTests.swift
//  BlurhashPOCTests
//
//  Created by marilyn A on 7/2/21.
//

import XCTest
@testable import BlurhashPOC

class CustomImageViewTests: XCTestCase {
    
    var sut : CustomImageView!
    var image : Image!
    var url : String!
    var urlForImage : String!
    
    override func setUpWithError() throws {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        
        let data = loadStub(name: "images", extension: "json")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        image = try decoder.decode(Image.self, from: data)
        
        url = "https://posterposse.cm/wp-content/uploads/2017/06/main-1024x637.jpeg"
        urlForImage = "https://www.browserstack.com/guide/unit-testing-best-practices"
        sut = CustomImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 250))
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_CustomImage_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = expectation(description: "An empty request URL string expectation")
        
        // Act
        sut.loadImageUsingUrlString(urlString: "") { (image,error)  in
            // Assert
            XCTAssertEqual(error, RequestError.invalidRequestURLString, "The loadImageUsingUrlString method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(image, "When an invalidRequestURLString takes place, the response must be nil")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func test_CustomImage_WhenURLStringProvided_ReturnsImage(){
        
    }
    
    func test_CustomImage_WhenGivenInCorrectURL_ReturnsFailure() {
        
        // Arrange
        let expectation = self.expectation(description: "Custom Image Response Expectation")
        let errorDescription = "A server with the specified hostname could not be found."
        
        // Act
        sut.loadImageUsingUrlString(urlString:url) { (image,error)  in
            // Assert
            XCTAssertEqual(error, RequestError.failedRequest(description: errorDescription), "The signup() method did not return an expecter error for the Failed Request")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func test_CustomImage_WhenGivenCorrectURL_ReturnsFailureResponse() {
        
        // Arrange
        let expectation = self.expectation(description: "The URL provided does not have image data")
        
        // Act
        sut.loadImageUsingUrlString(urlString: urlForImage) { (image,error)  in
            // Assert
            XCTAssertNil(image, "The response for a request containing unknown image data, should have been nil")
            XCTAssertEqual(error, RequestError.invalidResponseModel, "The method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func test_CustomImage_WhenGivenCorrectURL_ReturnsSuccess() {
        
        // Arrange
        let expectation = self.expectation(description: "Custom Image Response Expectation")
        
        // Act
        sut.loadImageUsingUrlString(urlString: self.image.imageUrl) { (image,error)  in
            // Assert
            XCTAssertNotNil(image)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testScoreIsComputedPerformance() {
        measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTStorageMetric(), XCTMemoryMetric()]) {
        }
    }
    
    
    
}
