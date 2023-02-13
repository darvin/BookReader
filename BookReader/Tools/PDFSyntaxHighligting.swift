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
    
    
    
    
    func findMonospacedFragments(attributedString: NSAttributedString) -> [(NSRange, CGRect)] {
        let string = attributedString.string
        let fontAttributeName = NSAttributedString.Key.font
        let monospaceFontAttribute = attributedString.attribute(fontAttributeName, at: 0, effectiveRange: nil) as? UIFont

        var fragments: [(NSRange, CGRect)] = []
        var startIndex = 0

        while startIndex < string.count {
            var range = NSRange(location: startIndex, length: string.count - startIndex)
            let fontAttribute = attributedString.attribute(fontAttributeName, at: startIndex, effectiveRange: &range) as? UIFont

            if let monospaceFontAttribute = monospaceFontAttribute, let fontAttribute = fontAttribute, fontAttribute.fontName == monospaceFontAttribute.fontName {
                let rect = getRectFor(range: range)
                fragments.append((range, rect))
            }

            startIndex = range.location + range.length
        }

        return fragments
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

    
    let monospacedLines = findMonospacedFragments(attributedString: attributedText)
    print(monospacedLines)
//    let joinedLines = joinContinuousMonospacedLines(lines: monospacedLines)

    return monospacedLines
}



extension Character {
    func isWide() -> Bool? {
        let narrowChars = "abcdefghijklmnopqrstuvwxyz0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^`{|}~I"
        let wideChars = "MWmw_ABCDEFGHJKLMNOPQRSTUVWXYZ"
        let scalars = String(self).unicodeScalars
        let scalarValue = scalars[scalars.startIndex].value
        if narrowChars.contains(self) {
            return false
        } else if wideChars.contains(self) {
            return true
        } else {
            return nil
        }
    }
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
