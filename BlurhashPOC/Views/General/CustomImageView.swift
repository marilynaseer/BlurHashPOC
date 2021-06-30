//
//  CustomImageView.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/18/21.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    //typealias completion = () -> Void?

    
    func   loadImageUsingUrlString(urlString: String,completion: @escaping (UIImage)->()) {
        
        imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            if error != nil {
                print(error ?? "")
                return
            }
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data!) else { return }
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache, forKey: urlString as NSString)
                
                completion(self.image ?? UIImage())
            }
        }).resume()
    }
    
}
