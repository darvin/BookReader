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

    func getWords(in pageText: NSAttributedString, linebreakRanges: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
            let wordSeparators = CharacterSet(charactersIn: " \n\t.,;:!?")
            var words = [(NSRange, CGRect)]()
            var wordIndex = 0

            linebreakRanges.forEach { lineRange, lineRect in
                let lineText = (pageText.string as NSString).substring(with: lineRange)
                let lineCharacters = Array(lineText)
                var wordStart = 0
                var inWord = false

                for (index, character) in lineCharacters.enumerated() {
                    if wordSeparators.contains(character.unicodeScalars.first!) {
                        if inWord {
                            let wordRange = NSRange(location: lineRange.location + wordStart, length: index - wordStart)
                            let wordRect = getRectFor(range: wordRange)
                            words.append((wordRange, wordRect))
                            inWord = false
                        }

                        if wordIndex % 2 == 0 && lineCharacters.count >= 2 {
                            if index < lineCharacters.count - 1 {
                                let wordRange = NSRange(location: lineRange.location + index, length: 2)
                                let wordRect = getRectFor(range: wordRange)
                                words.append((wordRange, wordRect))
                            } else if index == lineCharacters.count - 1 {
                                let wordRange = NSRange(location: lineRange.location + wordStart, length: lineCharacters.count - wordStart)
                                let wordRect = getRectFor(range: wordRange)
                                words.append((wordRange, wordRect))
                            }
                        }
                    } else if !inWord {
                        wordStart = index
                        inWord = true
                    }
                }

                if inWord {
                    let wordRange = NSRange(location: lineRange.location + wordStart, length: lineCharacters.count - wordStart)
                    let wordRect = getRectFor(range: wordRange)
                    words.append((wordRange, wordRect))
                }

                wordIndex += 1
            }

            return words
        }



    let wordRanges = getWords(in: pageText, linebreakRanges: linebreakRanges)
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

//    let joinedLines = joinContinuousMonospacedLines(lines: monospacedLines)

    return joinContinuousMonospacedLines(lines:getMonospaceLines(linebreakRanges: linebreakRanges, wordRanges: wordRanges))
}


func joinContinuousMonospacedLines(lines: [(NSRange, CGRect)]) -> [(NSRange, CGRect)] {
    var result: [(NSRange, CGRect)] = []
    var currentLine: (NSRange, CGRect) = lines.first!
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
