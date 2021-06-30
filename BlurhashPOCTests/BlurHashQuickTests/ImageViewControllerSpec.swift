//
//  ImageViewControllerSpec.swift
//  BlurhashPOCTests
//
//  Created by marilyn A on 6/29/21.
//

import Foundation

import Quick
import Nimble
@testable import BlurhashPOC

class ImageViewControllerSpec: QuickSpec {
    override func spec() {
        var sut: ImageViewController!
        describe("The 'View Controller'") {
            context("Can show the correct labels text") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    // 1
                    sut = ImageViewController()
                    _ = sut.view
                    expect(sut.view).notTo(beNil())

                    let data = self.loadStub(name: "images", extension: "json")
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    let imageData = try! decoder.decode(Image.self, from: data)
                    sut.data = ImageViewModel(imageModel: imageData)
                    
                }
                it("can show the correct text within the title") {
                    // 2
                    expect(sut.title).to(equal("ZEE5"))
                }
                
                it("check if tableview is not nil") {
                    // 3
                    expect(sut.myTableView).toNotEventually(beNil())
                    
                }
                
            }
        }
    }
}


////                print("i m in viewmodel")
//                subject = ImageViewController()
//                _ = subject.view
//                subject.data = self.viewModel

//            xcontext("when view is loaded"){
//                var cell : ImageViewCell!
//
//                beforeEach {
//
//                    cell = subject.tableView(subject.myTableView, cellForRowAt: IndexPath(row: 1, section: 1)) as? ImageViewCell
//                }
//                xit("should have 7 cells with movies loaded"){
//                    expect(cell.collectionView.numberOfSections).toEventually(equal(7))
//                }
//            }
