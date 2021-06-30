//
//  XCTestCase.swift
//  BlurhashPOCTests
//
//  Created by marilyn A on 6/28/21.
//

import XCTest

extension XCTestCase {

    func loadStub(name: String, extension: String) -> Data {
        // Obtain Reference to Bundle
        let bundle = Bundle(for: type(of: self))
        
        // Ask Bundle for URL of Stub
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        // Use URL to Create Data Object
        return try! Data(contentsOf: url!)
    }
    
}
