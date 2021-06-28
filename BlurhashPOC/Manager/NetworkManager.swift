//
//  NetworkManager.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/18/21.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let session = URLSession.shared
    let cache = NSCache<NSString,UIImage>()
    
    private init(){
    }
    
    //oneplus ip 192.168.43.169
    //router ip  192.168.1.3
 
    func fetchImages(completed: @escaping (Result<Image, ErrorType>) -> Void) {
        guard let url = URL(string: "http://192.168.1.10:3000/getImages") else {
            completed(.failure(.invalidURL))
            return
        }
        

        let task = session.dataTask(with:url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let searchResult = try decoder.decode(Image.self, from: data)
                completed(.success(searchResult))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
    
    
}
