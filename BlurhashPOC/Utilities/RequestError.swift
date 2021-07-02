//
//  RequestError.swift
//  BlurhashPOC
//
//  Created by marilyn A on 7/2/21.
//

import Foundation

enum RequestError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }
    
}
