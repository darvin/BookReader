//
//  String_ProgrammingLanguage.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation

import UIKit

extension UIColor {
    var isGray: Bool {
        guard let components = self.cgColor.components else {return true}
        guard components.count >= 3 else {return true}
        let r = components[0]
        let g = components[1]
        let b = components[2]
        let tolerance: CGFloat = 0.05
        return abs(r - g) < tolerance && abs(r - b) < tolerance && abs(g - b) < tolerance
    }
}



extension NSAttributedString {
    func removingGrayForegroundAttributes() -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        
        mutableAttributedString.enumerateAttributes(in: NSRange(location: 0, length: self.length), options: []) { (attributes: [NSAttributedString.Key: Any], range: NSRange, stop: UnsafeMutablePointer<ObjCBool>) in
            if let color = attributes[NSAttributedString.Key.foregroundColor] as? UIColor, color.isGray {
                mutableAttributedString.removeAttribute(NSAttributedString.Key.foregroundColor, range: range)
            }
        }
        
        return NSAttributedString(attributedString: mutableAttributedString)
    }
}
