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


let MonospacedLinesTreshold = 0.3
func findMonospacedLines(lines: [(NSAttributedString, NSRange, CGRect)], getRectFor: (NSRange) -> CGRect) -> [(NSAttributedString, NSRange, CGRect)] {
  let monospacedLines: [(NSAttributedString, NSRange, CGRect)] = lines.enumerated().reduce([]) { result, line in
    let charWidth = line.element.2.width / CGFloat(line.element.0.length)
    let previousLine: (NSAttributedString, NSRange, CGRect)?
    if line.offset > 0 {
      previousLine = lines[line.offset - 1]
    } else {
      let previousRange = NSRange(location: line.element.1.location - 1, length: 1)
      let previousRect = getRectFor( previousRange)
      previousLine = (NSAttributedString(string: " "), previousRange, previousRect)
    }
    let nextLine: (NSAttributedString, NSRange, CGRect)?
    if line.offset < lines.count - 1 {
      nextLine = lines[line.offset + 1]
    } else {
      let nextRange = NSRange(location: line.element.1.location + line.element.1.length, length: 1)
      let nextRect = getRectFor(nextRange)
      nextLine = (NSAttributedString(string: " "), nextRange, nextRect)
    }
    let previousCharWidth = previousLine!.2.width / CGFloat(previousLine!.0.length)
    let nextCharWidth = nextLine!.2.width / CGFloat(nextLine!.0.length)
    if abs(charWidth - previousCharWidth) < MonospacedLinesTreshold && abs(charWidth - nextCharWidth) < MonospacedLinesTreshold {
      return result + [line.element]
    }
    return result
  }
  return monospacedLines
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
