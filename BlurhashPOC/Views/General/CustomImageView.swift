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
    
    func loadImageUsingUrlString(urlString: String,completion: @escaping (UIImage?,RequestError?)-> Void) {
        
        imageUrlString = urlString
        guard let url = URL(string: urlString) else {
            completion(nil,RequestError.invalidRequestURLString)
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let requestError = error {
                completion(nil,RequestError.failedRequest(description: requestError.localizedDescription))
                return
            }
            guard let image = UIImage(data: data!) else {
                completion(nil,RequestError.invalidResponseModel)
                return }
            
            completion(image,nil)
            
        }).resume()
    }
    
}
