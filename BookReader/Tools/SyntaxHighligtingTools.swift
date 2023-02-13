//
//  SyntaxHighligtingTools.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation
import UIKit
import Highlightr



let RemovingColorsWithLowLineCoverageTreshold = 0.0
let RemovingColorsFromLongLinesTreshold = 100


public class Highlighter {
    static let shared = Highlighter()
    private var highlightr: Highlightr?
    private init() {
        self.highlightr = Highlightr()
        highlightr?.setTheme(to: "xcode")
    }
    
    func highlight(_ text:String, inBook book:(any BookMetadatable)?) -> NSAttributedString? {
        var language: String? = nil
        
        if let book = book {
            for lang in HighlighterLanguages {
                if book.title.lowercased().contains(lang) {
                    language = lang
                    break
                }
            }
        }
        
        return highlightr?.highlight(text, as: language)
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
    func removeForegroundColorFromLongLines() -> NSAttributedString {
          let mutableAttributedString = NSMutableAttributedString(attributedString: self)
          let range = NSRange(location: 0, length: mutableAttributedString.length)
          var lineRange = mutableAttributedString.lineRange(for: range)
          while lineRange.location < NSMaxRange(range) {
              if lineRange.length > RemovingColorsFromLongLinesTreshold {
                  mutableAttributedString.removeAttribute(.foregroundColor, range: lineRange)
              }
              lineRange = NSRange(location: NSMaxRange(lineRange), length: NSMaxRange(range) - NSMaxRange(lineRange))
              if lineRange.location >= NSMaxRange(range) {
                  break
              }
              lineRange = mutableAttributedString.lineRange(for: lineRange)
          }
          return NSAttributedString(attributedString: mutableAttributedString)
      }
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
            if Double(lineColorizedCount) / Double(lineRange.length) < RemovingColorsWithLowLineCoverageTreshold {
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



let HighlighterLanguages =
[
    "1c",
    "abnf",
    "accesslog",
    "actionscript",
    "ada",
    "angelscript",
    "apache",
    "applescript",
    "arcade",
    "arduino",
    "armasm",
    "asciidoc",
    "aspectj",
    "autohotkey",
    "autoit",
    "avrasm",
    "awk",
    "axapta",
    "bash",
    "basic",
    "bnf",
    "brainfuck",
    "c",
    "cal",
    "capnproto",
    "ceylon",
    "clean",
    "clojure-repl",
    "clojure",
    "cmake",
    "coffeescript",
    "coq",
    "cos",
    "cpp",
    "crmsh",
    "crystal",
    "csharp",
    "csp",
    "css",
    "d",
    "dart",
    "delphi",
    "diff",
    "django",
    "dns",
    "dockerfile",
    "dos",
    "dsconfig",
    "dts",
    "dust",
    "ebnf",
    "elixir",
    "elm",
    "erb",
    "erlang-repl",
    "erlang",
    "excel",
    "fix",
    "flix",
    "fortran",
    "fsharp",
    "gams",
    "gauss",
    "gcode",
    "gherkin",
    "glsl",
    "gml",
    "go",
    "golo",
    "gradle",
    "graphql",
    "groovy",
    "haml",
    "handlebars",
    "haskell",
    "haxe",
    "hsp",
    "http",
    "hy",
    "inform7",
    "ini",
    "irpf90",
    "isbl",
    "java",
    "javascript",
    "jboss-cli",
    "json",
    "julia-repl",
    "julia",
    "kotlin",
    "lasso",
    "latex",
    "ldif",
    "leaf",
    "less",
    "lisp",
    "livecodeserver",
    "livescript",
    "llvm",
    "lsl",
    "lua",
    "makefile",
    "markdown",
    "mathematica",
    "matlab",
    "maxima",
    "mel",
    "mercury",
    "mipsasm",
    "mizar",
    "mojolicious",
    "monkey",
    "moonscript",
    "n1ql",
    "nestedtext",
    "nginx",
    "nim",
    "nix",
    "node-repl",
    "nsis",
    "objectivec",
    "ocaml",
    "openscad",
    "oxygene",
    "parser3",
    "perl",
    "pf",
    "pgsql",
    "php-template",
    "php",
    "plaintext",
    "pony",
    "powershell",
    "processing",
    "profile",
    "prolog",
    "properties",
    "protobuf",
    "puppet",
    "purebasic",
    "python-repl",
    "python",
    "q",
    "qml",
    "r",
    "reasonml",
    "rib",
    "roboconf",
    "routeros",
    "rsl",
    "ruby",
    "ruleslanguage",
    "rust",
    "sas",
    "scala",
    "scheme",
    "scilab",
    "scss",
    "shell",
    "smali",
    "smalltalk",
    "sml",
    "sqf",
    "sql",
    "stan",
    "stata",
    "step21",
    "stylus",
    "subunit",
    "swift",
    "taggerscript",
    "tap",
    "tcl",
    "thrift",
    "tp",
    "twig",
    "typescript",
    "vala",
    "vbnet",
    "vbscript-html",
    "vbscript",
    "verilog",
    "vhdl",
    "vim",
    "wasm",
    "wren",
    "x86asm",
    "xl",
    "xml",
    "xquery",
    "yaml",
    "zephir",]
