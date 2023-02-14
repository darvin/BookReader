//
//  PDFSyntaxHighligting.swift
//  BookReader
//
//  Created by standard on 2/13/23.
//

import Foundation

import PDFKit



func HightlightSyntaxIn(page:PDFPage, book: (any BookMetadatable)?) -> [(NSRange, CGRect)] {
    
    guard let pageAttributedText = page.attributedString  else { return [] }
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
        let tolerance: CGFloat = 0.05
        
        let monospacedRanges = lineRanges.filter { lineRange in
            let lineCharacterRanges = sortedRanges.filter { lineRange.0.contains($0.0.location) }
            guard let firstCharacterRect = lineCharacterRanges.first?.1 else { return false }
            let isMonospaced = lineCharacterRanges.allSatisfy {
                let widthRatio = $0.1.width / firstCharacterRect.width
                return (1.0 - tolerance) <= widthRatio && widthRatio <= (1.0 + tolerance)
            }
            return isMonospaced
        }
        
        return monospacedRanges
    }

    
    let monospacedLines = getMonospacedLines(lineRanges: lines, characterRanges: characterRanges)
    return monospacedLines
}


func joinContinuousMonospacedLines(lines: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
    var result: [(NSRange, CGRect)] = []
    guard let firstLine = lines.first else {return []}
    var currentLine: (NSRange, CGRect) = firstLine
    for i in 1..<lines.count {
        let nextLine = lines[i]
        let lineDistance = nextLine.0.location - currentLine.0.location - currentLine.0.length
        let rectDistance = abs(nextLine.1.minY - currentLine.1.maxY)
        if lineDistance < 4 && rectDistance < currentLine.1.height / 2 {
            currentLine = (NSRange(location: currentLine.0.location, length: nextLine.0.location + nextLine.0.length - currentLine.0.location), CGRect(x: currentLine.1.minX, y: currentLine.1.minY, width: currentLine.1.width, height: nextLine.1.maxY - currentLine.1.minY))
        } else {
            result.append(currentLine)
            currentLine = nextLine
        }
    }
    result.append(currentLine)
    return result
}
