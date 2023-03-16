//
//  NSAttributedString+Tools.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation
import UIKit

extension NSAttributedString {
    func removingGrayForegroundAttributes() -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)

        mutableAttributedString.enumerateAttributes(
            in: NSRange(location: 0, length: self.length),
            options: []
        ) {
            (
                attributes: [NSAttributedString.Key: Any],
                range: NSRange,
                stop: UnsafeMutablePointer<ObjCBool>
            ) in
            if let color = attributes[NSAttributedString.Key.foregroundColor] as? UIColor,
                color.isGray
            {
                mutableAttributedString.removeAttribute(
                    NSAttributedString.Key.foregroundColor,
                    range: range
                )
            }
        }

        return NSAttributedString(attributedString: mutableAttributedString)
    }
}

extension NSAttributedString {
    var countForegroundColorAttributes: Int {
        var count = 0
        self.enumerateAttributes(in: NSRange(location: 0, length: self.length), options: []) {
            attributes,
            range,
            _ in
            if let _ = attributes[.foregroundColor] as? UIColor {
                count += 1
            }
        }
        return count
    }
}
