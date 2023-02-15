//
//  NSRange+Tools.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation

extension NSRange {
    func union(with range: NSRange) -> NSRange {
        let start = min(self.location, range.location)
        let end = max(self.location + self.length, range.location + range.length)
        let length = end - start
        return NSRange(location: start, length: length)
    }
}
