//
//  BlurhashPOCTests.swift
//  BlurhashPOCTests
//
//  Created by marilyn A on 6/17/21.
//

import XCTest
@testable import BlurhashPOC

class ImageViewModelests: XCTestCase {

    var sut : ImageViewModel!
        
    override func setUpWithError() throws {
        let data = loadStub(name: "images", extension: "json")
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let imageData = try decoder.decode(Image.self, from: data)
        sut = ImageViewModel(imageModel: imageData)
    }

    override func tearDownWithError() throws {
    }
    
    func test_ImageViewModel_WhenGivenSuccesfulResponse_ValuesAreSet(){
        
        //Act
        let image = Image(description: "Wonder Woman", imageUrl: "https://posterposse.com/wp-content/uploads/2017/06/main-1024x637.jpeg", blurhash: "LnMrVqIBRQSh?vM{oIbH16oySys9")
        
        //Assert
        XCTAssertEqual(image.blurhash, sut.blurhash)
        XCTAssertEqual(image.description, sut.description)
        XCTAssertEqual(image.imageUrl , sut.imageUrl)
    }
    
    func testScoreIsComputedPerformance() {
      measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTStorageMetric(), XCTMemoryMetric()]) {
      }
    }
    
    
    
}
