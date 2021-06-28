//
//  UIColor+Extension.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/17/21.
//


import UIKit


public extension UIColor{
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var mainColor = UIColor(r: 29.0, g: 0.0, b: 31.0) 
}
