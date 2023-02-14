//
//  PDFSyntaxHighligting.swift
//  BookReader
//
//  Created by standard on 2/13/23.
//

import Foundation

import PDFKit


extension String {
    var removeSpaces: String {
        let components = self.components(separatedBy: NSCharacterSet.whitespaces)
        let filtered = components.filter({!$0.isEmpty})
        return filtered.joined(separator: "")
    }
}




extension NSAttributedString {
    var countForegroundColorAttributes: Int {
        var count = 0
        self.enumerateAttributes(in: NSRange(location: 0, length: self.length), options: []) { attributes, range, _ in
            if let foregroundColor = attributes[.foregroundColor] as? UIColor {
                count += 1
            }
        }
        return count
    }
}


func HightlightSyntaxIn(page:PDFPage, book: (any BookMetadatable)?) -> [(NSAttributedString, NSRange, CGRect)] {
    let monospacedFragments = findMonospacedFragments(page: page)
    
    guard let pageText: NSString = page.string as NSString?  else { return [] }

    let highlightedFragments = monospacedFragments.map { (range, rect) in
        []
        
        let str = pageText.substring(with: range)
        
        let highlightedStrings = Highlighter.shared.highlight(str, inBook: book).sorted { $0.countForegroundColorAttributes > $1.countForegroundColorAttributes }
        
        let highlightedString = highlightedStrings.first ?? NSAttributedString(string: str)
        
        return (highlightedString, range, rect)
        
    }
    
    return highlightedFragments
    
}




func findMonospacedFragments(page:PDFPage) -> [(NSRange, CGRect)] {
    
    guard let pageText: NSString = page.string as NSString?  else { return [] }
    
    
    func getRectFor(range:NSRange) -> CGRect {
        let rect = page.selection(for: range)?.bounds(for: page)
        return rect ?? CGRectNull
    }
    
    func getCharacters(text: NSString, getRectFor: (NSRange) -> CGRect) -> [(NSRange, CGRect)] {
        var result = [(NSRange, CGRect)]()
        let stringLength = text.length
        var characterRange = NSRange(location: 0, length: 0)
        for i in 0..<stringLength {
            let character = text.character(at: i)
            if !CharacterSet.newlines.contains(UnicodeScalar(character)!) {
                characterRange.length = 1
                let rect = getRectFor(characterRange)
                result.append((characterRange, rect))
                characterRange.location += 1
            } else {
                characterRange.location += 1
            }
        }
        return result
    }
    
    
    let characterRanges = getCharacters(text: pageText, getRectFor: getRectFor)
    
    func getLines(from characterRanges: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
        let sortedRanges = characterRanges.sorted { $0.1.minY < $1.1.minY }
        var lineRanges: [(NSRange, CGRect)] = []
        
        for range in sortedRanges {
            if let lastRange = lineRanges.last, abs(lastRange.1.minY - range.1.minY) < 0.39 {
                lineRanges[lineRanges.count-1].0.length = range.0.location + range.0.length - lineRanges[lineRanges.count-1].0.location
                lineRanges[lineRanges.count-1].1 = lastRange.1.union(range.1)
            } else {
                lineRanges.append(range)
            }
        }
        
        return lineRanges
    }
    
    let lines = getLines(from: characterRanges)
    
    func getMonospacedLines(lineRanges: [(NSRange, CGRect)], characterRanges: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
        let sortedRanges = characterRanges.sorted { $0.1.minY < $1.1.minY }
        let tolerance: CGFloat = 0.04
        
        let monospacedRanges = lineRanges.filter { lineRange in
            let lineCharacterRanges = sortedRanges.filter { lineRange.0.contains($0.0.location) }
            guard let firstCharacterRect = lineCharacterRanges.first?.1 else { return false }
            
            let line = pageText.substring(with: lineRange.0).removeSpaces
            
            if line.count == 0 {
                return false
            } else if line.count == 1 {
                if "{}[]()|\\|/".contains(line){
                    return true
                }
            } else {
                // Check if all characters in the line have approximately the same width
                let isMonospaced = lineCharacterRanges.allSatisfy {
                    let widthRatio = $0.1.width / firstCharacterRect.width
                    return (1.0 - tolerance) <= widthRatio && widthRatio <= (1.0 + tolerance)
                }
                return isMonospaced
            }
            return false
        }
        
        return monospacedRanges
    }
    
    
    
    let monospacedLines = getMonospacedLines(lineRanges: lines, characterRanges: characterRanges)
    
    
    let joinedLines = joinContinuousMonospacedLines(in: pageText, lines: monospacedLines)
    return joinedLines
}


extension NSRange {
    func union(with range: NSRange) -> NSRange {
        let start = min(self.location, range.location)
        let end = max(self.location + self.length, range.location + range.length)
        let length = end - start
        return NSRange(location: start, length: length)
    }
}

func joinContinuousMonospacedLines(in text:NSString, lines: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
    guard let firstLine = lines.first else {return []}
    let tolerance: CGFloat = 5.0
    
    var result = [(NSRange, CGRect)]()
    var currentLine = firstLine
    
    for nextLine in lines.dropFirst() {
        if abs(nextLine.1.minY - currentLine.1.maxY) <= tolerance {
            currentLine.0 = currentLine.0.union(nextLine.0)
            currentLine.1 = currentLine.1.union(nextLine.1)
        } else {
            result.append(currentLine)
            currentLine = nextLine
        }
    }
    
    result.append(currentLine)
    
    return result
}
