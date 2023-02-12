//
//  SyntaxHighligtingTools.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation
import UIKit
import Highlightr

public class Highlighter {
    static let shared = Highlighter()
    private var highlightr: Highlightr?
    private init() {
        self.highlightr = Highlightr()
        highlightr?.setTheme(to: "routeros")
    }
    
    func highlight(_ text:String) -> NSAttributedString? {
        return highlightr?.highlight(text)
    }
}

extension UIColor {

    func shouldIgnore() -> Bool {
        var r1: CGFloat = 0
        var g1: CGFloat = 0
        var b1: CGFloat = 0
        var a1: CGFloat = 0
        getRed(&r1, green: &g1, blue: &b1, alpha: &a1)

        return  0.3 > r1 && r1 > 0.1 && 0.3 > g1 && g1 > 0.1 && 0.3 > b1 && b1 > 0.1
    }
}

extension NSAttributedString {
    func removingIgnoredColors() -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        let range = NSRange(location: 0, length: mutableAttributedString.length)
        mutableAttributedString.enumerateAttributes(in: range, options: []) { attributes, range, _ in
            if let color = attributes[.foregroundColor] as? UIColor, color.shouldIgnore() {
                mutableAttributedString.removeAttribute(.foregroundColor, range: range)
            }
        }
        return NSAttributedString(attributedString: mutableAttributedString)
    }
    
    
    func removingColorsWithLowLineCoverage() -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        let range = NSRange(location: 0, length: mutableAttributedString.length)
        var lineRange = mutableAttributedString.lineRange(for: range)
        while lineRange.location < NSMaxRange(range) {
            var lineColorizedCount = 0
            mutableAttributedString.enumerateAttributes(in: lineRange, options: [.longestEffectiveRangeNotRequired]) { attributes, range, _ in
                if let color = attributes[.foregroundColor] as? UIColor, !color.shouldIgnore() {
                    lineColorizedCount += range.length
                }
            }
            if Double(lineColorizedCount) / Double(lineRange.length) < 0.7 {
                mutableAttributedString.removeAttribute(.foregroundColor, range: lineRange)
            }
            lineRange = NSRange(location: NSMaxRange(lineRange), length: NSMaxRange(range) - NSMaxRange(lineRange))
            if lineRange.length == 0 {
                break
            }
        }
        return NSAttributedString(attributedString: mutableAttributedString)
    }


    func lineRange(for range: NSRange) -> NSRange {
        let index = range.location
        let string = self.string as NSString
        let start = string.lineRange(for: NSRange(location: index, length: 0)).location
        let end = NSMaxRange(string.lineRange(for: NSRange(location: index, length: 0)))
        return NSRange(location: start, length: end - start)
    }
}
