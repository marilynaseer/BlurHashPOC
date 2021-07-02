//
//  ImageViewModelSpec.swift
//  BlurhashPOCTests
//
//  Created by marilyn A on 6/28/21.
//

import Quick
import Nimble
@testable import BlurhashPOC

class ImageViewModelSpec : QuickSpec{
    
    var viewModel : ImageViewModel!
    let image = Image(description: "Wonder Woman", imageUrl: "https://posterposse.com/wp-content/uploads/2017/06/main-1024x637.jpeg", blurhash: "LnMrVqIBRQSh?vM{oIbH16oySys9")
    
    override func spec() {
    
        xdescribe("ImageViewController"){
            beforeEach {
                let data = self.loadStub(name: "images", extension: "json")
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .secondsSince1970
                
                let imageData = try! decoder.decode(Image.self, from: data)
                self.viewModel = ImageViewModel(imageModel: imageData)
            }
            context("set image data"){
                it("should have values set to the model"){
                    expect(self.image.blurhash).to(equal(self.viewModel.blurhash))
                    expect(self.image.description).to(equal(self.viewModel.description))
                    expect(self.image.imageUrl).to(equal(self.viewModel.imageUrl))
                }
            }
        }
         
    }
}
