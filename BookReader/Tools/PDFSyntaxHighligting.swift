//
//  PDFSyntaxHighligting.swift
//  BookReader
//
//  Created by standard on 2/13/23.
//

import Foundation

import PDFKit



func HightlightSyntaxIn(page:PDFPage, book: (any BookMetadatable)?) -> [(NSRange, CGRect)] {
    
    guard let pageText = page.attributedString  else { return [] }

    let textStorage = NSTextStorage(attributedString: pageText)
    let layoutManager = NSLayoutManager()
    textStorage.addLayoutManager(layoutManager)
    let textContainer = NSTextContainer(size: .zero)
    layoutManager.addTextContainer(textContainer)

    var range = NSRange(location: 0, length: 0)
    var index = 0
    
    func getRectFor(range:NSRange) -> CGRect {
        let rect = page.selection(for: range)?.bounds(for: page)
        return rect ?? CGRectNull
    }
    
    
    var linebreakRanges = [(NSRange, CGRect)] ()
    while index < layoutManager.numberOfGlyphs {
        layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: &range)
        let lineRange = layoutManager.glyphRange(forCharacterRange: range, actualCharacterRange: nil)
        let lineRect = getRectFor(range: lineRange)
        linebreakRanges.append((lineRange, lineRect))
        index = NSMaxRange(range)
    }
    
    func removeNewLineSymbols(in pageText: NSAttributedString, linebreakRanges: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
        var updatedLinebreakRanges = [(NSRange, CGRect)]()

        linebreakRanges.forEach { lineRange, lineRect in
            let lineText = pageText.attributedSubstring(from: lineRange).string
            if !lineText.contains("\n") {
                updatedLinebreakRanges.append((lineRange, lineRect))
                return
            }

            let newLineRange = NSRange(location: lineRange.location, length: lineRange.length - 1)
            let newLineRect = getRectFor(range: newLineRange)
            updatedLinebreakRanges.append((newLineRange, newLineRect))
        }

        return updatedLinebreakRanges
    }

    linebreakRanges = removeNewLineSymbols(in: pageText, linebreakRanges: linebreakRanges)
    
    func getCharacters(in pageText: NSAttributedString, linebreakRanges: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
        var characters = [(NSRange, CGRect)]()

        linebreakRanges.forEach { lineRange, lineRect in
            let lineText = (pageText.string as NSString).substring(with: lineRange)
            let lineCharacters = Array(lineText)

            for (index, character) in lineCharacters.enumerated() {
                let characterRange = NSRange(location: lineRange.location + index, length: 1)
                let characterRect = getRectFor(range: characterRange)
                characters.append((characterRange, characterRect))
//                print("\(character)   \(characterRect.minY)")
            }
        }

        return characters
    }

    let characterRanges = getCharacters(in: pageText, linebreakRanges: linebreakRanges)
    
    
    func getContinuousLines(characterRanges: [(NSRange, CGRect)], linebreakRanges: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
        var continuousLines = [(NSRange, CGRect)]()
        
        linebreakRanges.forEach { lineRange, lineRect in
            if lineRange.length == 1 {
                continuousLines.append((lineRange, lineRect))
                return
            }
            if let firstCharacterRange = characterRanges.first(where: { NSLocationInRange($0.0.location, lineRange) }),
                        let lastCharacterRange = characterRanges.last(where: { NSLocationInRange($0.0.location, lineRange) })
                         {
                let lastCharacterRect = lastCharacterRange.1
                let firstCharacterRect = firstCharacterRange.1
                if abs(firstCharacterRect.minY - lastCharacterRect.minY) <= lineRect.height / 2 {
                            continuousLines.append((lineRange, lineRect))
                        }
                else {
                    let firstCharacter = (pageText.string as NSString).substring(with: firstCharacterRange.0)
                    let lastCharacter = (pageText.string as NSString).substring(with: lastCharacterRange.0)
                    print(" '\(firstCharacter)' minY  \(firstCharacterRect.minY) '\(lastCharacter)' minY  \(lastCharacterRect.minY) '\((pageText.string as NSString).substring(with: lineRange))'")
                }
            }
        }
        
        return continuousLines
    }

    
    let continuousLines = getContinuousLines(characterRanges: characterRanges, linebreakRanges: linebreakRanges)
    
    func getMonospaceLines(linebreakRanges: [(NSRange, CGRect)], wordRanges: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
        let monospaceLines = linebreakRanges.filter { lineRange, lineRect in
            let lineWords = wordRanges.filter { wordRange, wordRect in
                return lineRange.contains(wordRange.location)
            }

            let totalCharacterWidth = lineWords.reduce(0) { (result, wordRangeAndRect) in
                result + wordRangeAndRect.1.width
            }
            let totalCharacterCount = lineWords.reduce(0) { (result, wordRangeAndRect) in
                result + wordRangeAndRect.0.length
            }
            let averageCharacterWidth = totalCharacterWidth / CGFloat(totalCharacterCount)

            return lineWords.allSatisfy { wordRange, wordRect in
                return abs(wordRect.width / CGFloat(wordRange.length) - averageCharacterWidth) < 1.8
            }
        }

        return monospaceLines
    }
    
    

    let joinedLines = joinContinuousMonospacedLines(lines: continuousLines)

    return joinedLines
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
