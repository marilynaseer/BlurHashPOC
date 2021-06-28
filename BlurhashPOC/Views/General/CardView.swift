//
//  CardView.swift
//  BlurhashPOC
//
//  Created by marilyn A on 6/17/21.
//

import UIKit


class CardView: UIView {
    
    var cornerRadius: CGFloat = 40
    
    var shadowOffsetWidth: Int = 0
    var shadowOffsetHeight: Int = 1
    var shadowColor: UIColor? = UIColor.black
    var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowRect = bounds.insetBy(dx: 0, dy:2)
        let shadowPath = UIBezierPath(roundedRect: shadowRect, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        self.translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}



