//
//  ImageViewModel.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/28/21.
//

import UIKit

struct ImageViewModel {
    
    var xComponents: Int = 4
    var yComponents: Int = 3
    var punch: Float = 1
    
    let images : [UIImage] = [
        UIImage(named: "Aquaman")!,
        UIImage(named: "dredd")!,
        UIImage(named: "Avengers")!,
        UIImage(named: "DilBechara")!
    ]
    
    let imageArray : [UIImage]
    
    var blurHashArray = [String]()
    var blurArray = [String]()
    
    var description: String
    var imageUrl: String
    var blurhash: String
    
    var image : CustomImageView? {
        CustomImageView(image:UIImage(blurHash:self.blurhash, size: CGSize(width: 32, height: 32), punch: punch))
    }
    
    init(imageModel : Image){
        self.blurhash = imageModel.blurhash
        self.description = imageModel.description
        self.imageUrl = imageModel.imageUrl
        self.imageArray = images + images
        updateEncode()
    }
    
    mutating func updateEncode() {
    
        self.blurArray = ["LFHwPpS]8yE7~S-n9cMeTW?G0$Mx", "LCAc*vWB0fg2_NRPIBxaM|M{Wpx[", "LEC6}d5TvMxCBDn+iwxZ0h=[NdI@", "LBF#HwNx9tS#m:X8THW;~Tt6E3ae", "LFHwPpS]8yE7~S-n9cMeTW?G0$Mx", "LCAc*vWB0fg2_NRPIBxaM|M{Wpx[", "LEC6}d5TvMxCBDn+iwxZ0h=[NdI@", "LBF#HwNx9tS#m:X8THW;~Tt6E3ae"]
        
    }
}
