//
//  PDFSyntaxHighligting.swift
//  BookReader
//
//  Created by standard on 2/13/23.
//

import Foundation

import PDFKit



func HightlightSyntaxIn(page:PDFPage, book: (any BookMetadatable)?) -> [(NSAttributedString, NSRange, CGRect)] {
    
    guard let pageText = page.attributedString  else { return [] }

    let attributedText = pageText
    let textStorage = NSTextStorage(attributedString: attributedText)
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
    
    
    
    var lines = [(NSAttributedString, NSRange, CGRect)] ()
    while index < layoutManager.numberOfGlyphs {
        layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: &range)
        let lineRange = layoutManager.glyphRange(forCharacterRange: range, actualCharacterRange: nil)
        let lineAttributedText = attributedText.attributedSubstring(from: range)
        let lineRect = getRectFor(range: lineRange)
        lines.append((lineAttributedText, lineRange, lineRect))
        index = NSMaxRange(range)
    }

    
    let monospacedLines = findMonospacedLines(lines: lines, getRectFor: getRectFor)
    print(monospacedLines)
    let joinedLines = joinContinuousMonospacedLines(lines: monospacedLines)

    return joinedLines
}

func findMonospacedLines(lines: [(NSAttributedString, NSRange, CGRect)], getRectFor: (NSRange) -> CGRect) -> [(NSAttributedString, NSRange, CGRect)] {
    
    let MonospacedLinesTreshold = 0.3
    var result: [(NSAttributedString, NSRange, CGRect)] = []
    
    for line in lines {
        let attributedString = line.0
        
        // Split the line into fragments
        let fragments = splitLine(attributedString: attributedString)
        guard fragments.count >= 2 else { continue }

        // Check if the fragments have equal character widths
        var isMonospaced = true
        
        
        let firstFragmentRect = getRectFor(fragments[0].range)
        let firstFragmentWidth = firstFragmentRect.width / CGFloat(fragments[0].attributedString.length)
        
        for fragment in fragments[1...] {
            let fragmentRect = getRectFor(fragment.range)
            let fragmentWidth = fragmentRect.width / CGFloat(fragment.attributedString.length)
            if abs(firstFragmentWidth - fragmentWidth) > MonospacedLinesTreshold {
                isMonospaced = false
                break
            }
        }
        
        // Add the line to the result if it's monospaced
        if isMonospaced {
            result.append(line)
        }
    }
    
    return result
}
func splitLine(attributedString: NSAttributedString) -> [(attributedString: NSAttributedString, range: NSRange)] {
    let string = attributedString.string as NSString
    let words = string.components(separatedBy: .whitespacesAndNewlines)
    
    var fragments: [(attributedString: NSAttributedString, range: NSRange)] = []
    let stringLength = attributedString.length
    
    let minFragmentLength = max(1, stringLength / 4)
    let maxFragmentLength = min(stringLength / 2, (stringLength - minFragmentLength))
    
    var fragment1Length = 0
    var fragment2Length = 0
    
    for (index, word) in words.enumerated() {
        let wordLength = word.count
        let wordRange = NSRange(location: fragment1Length, length: wordLength)
        let wordAttributedString = attributedString.attributedSubstring(from: wordRange)
        
        let nextFragmentLength = fragment1Length + wordLength + 1
        if nextFragmentLength < minFragmentLength || nextFragmentLength <= maxFragmentLength {
            fragment1Length = nextFragmentLength
            fragments.append((wordAttributedString, wordRange))
        } else {
            fragment2Length += wordLength + 1
            if index == words.count - 1 {
                let fragmentRange = NSRange(location: fragment1Length, length: fragment2Length)
                if fragmentRange.location + fragmentRange.length <= stringLength {
                    let fragmentAttributedString = attributedString.attributedSubstring(from: fragmentRange)
                    fragments.append((fragmentAttributedString, fragmentRange))
                } else {
                    return []
                }
            }
        }
    }
    
    return fragments
}



func joinContinuousMonospacedLines(lines: [(NSAttributedString, NSRange, CGRect)]) -> [(NSAttributedString, NSRange, CGRect)] {
  var joinedLines: [(NSAttributedString, NSRange, CGRect)] = []
  var currentLine: (NSAttributedString, NSRange, CGRect)?
  for line in lines {
    if let current = currentLine {
      let charWidth = line.2.width / CGFloat(line.0.length)
      let lineHeight = line.2.height
      let currentCharWidth = current.2.width / CGFloat(current.0.length)
      let currentLineHeight = current.2.height
      if abs(charWidth - currentCharWidth) < 0.1 && abs(lineHeight - currentLineHeight) < 0.1 {
        let combinedString = NSMutableAttributedString(attributedString: current.0)
        combinedString.append(NSAttributedString(string: "\n"))
        combinedString.append(line.0)
        let combinedRange = NSRange(location: current.1.location, length: line.1.location + line.1.length - current.1.location)
        let combinedRect = CGRect(x: min(current.2.minX, line.2.minX), y: min(current.2.minY, line.2.minY), width: max(current.2.maxX, line.2.maxX) - min(current.2.minX, line.2.minX), height: max(current.2.maxY, line.2.maxY) - min(current.2.minY, line.2.minY))
        currentLine = (combinedString, combinedRange, combinedRect)
      } else {
        joinedLines.append(current)
        currentLine = line
      }
    } else {
      currentLine = line
    }
  }
  if let current = currentLine {
    joinedLines.append(current)
  }
  return joinedLines
}
