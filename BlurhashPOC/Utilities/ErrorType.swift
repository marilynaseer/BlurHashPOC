//
//  ErrorType.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/18/21.
//

import Foundation

enum ErrorType: String, Error {
    case invalidURL = "The URL entered is invalid. Please check it out and try again."
    case unableToComplete = "Unable to complete your request. PLease check your internet connection."
    case invalidResponse = "The response received from the server is invalid. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
    case unableToRetreiveItems = "There was an error trying to retrieve your items. Please try again."
    case unableToPersistItems = "There was an error adding the items to your records. Please try again."
    case alreadyBookmarked = "This item has already been added to your bookmarks. Your must be really interested."
    case alreadyDownloaded = "This item has already been added to your downloads. You must be really interested."
}
