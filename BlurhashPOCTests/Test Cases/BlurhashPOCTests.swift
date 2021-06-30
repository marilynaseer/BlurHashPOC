//
//  BlurhashPOCTests.swift
//  BlurhashPOCTests
//
//  Created by marilyn A on 6/17/21.
//

import XCTest
@testable import BlurhashPOC

class BlurhashPOCTests: XCTestCase {

    var viewModel : ImageViewModel!
        
    override func setUpWithError() throws {
        let data = loadStub(name: "images", extension: "json")
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let imageData = try decoder.decode(Image.self, from: data)
        viewModel = ImageViewModel(imageModel: imageData)
    }

    override func tearDownWithError() throws {
    }
    
    func testImageViewModel(){
        
        let image = ImageViewModel(imageModel: Image(description: "Wonder Woman", imageUrl: "https://posterposse.com/wp-content/uploads/2017/06/main-1024x637.jpeg", blurhash: "LnMrVqIBRQSh?vM{oIbH16oySys9"))
        
        XCTAssertEqual(image.blurhash, viewModel.blurhash)
        XCTAssertEqual(image.description, viewModel.description)
        XCTAssertEqual(image.imageUrl , viewModel.imageUrl)
    }
    
    func test_DataImageLoadedFromHTTPSURL() {

        let expected = expectation(description: "Image from https did load")

        let viewer = CustomImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 250))
        viewer.loadImageUsingUrlString(urlString: self.viewModel.imageUrl, completion: {_ in
            if viewer.image != nil {
                expected.fulfill()
            } else {
                XCTFail()
            }
        })
        waitForExpectations(timeout: 3.0, handler: nil)

    }
    
//    func test_ImagePngData(){
//
////
////        guard let data1 = viewModel?.image?.image?.pngData(), let data2 = image.pngData() else {
////            XCTFail("Data should not be nil")
////            return
////        }
////        XCTAssertEqual(data1, data2)
//    }
    func testScoreIsComputedPerformance() {
      measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTStorageMetric(), XCTMemoryMetric()]) {
      }
    }
    
    
    
}
