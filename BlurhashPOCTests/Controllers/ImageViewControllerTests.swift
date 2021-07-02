//
//  ImageViewControllerTests.swift
//  BlurhashPOCTests
//
//  Created by marilyn A on 7/2/21.
//

import XCTest
@testable import BlurhashPOC

class ImageViewControllerTests: XCTestCase {

    var sut:ImageViewController!
    
    override func setUpWithError() throws {
        sut  = ImageViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
       
    }
    
    func test_ImageViewController_WhenCreated_HasRequiredComponents(){
        
        let image = UIImage(named: "Raazi")
        XCTAssertEqual(sut.imageView.image?.pngData(), image?.pngData())
    }


}
