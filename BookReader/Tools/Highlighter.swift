//
//  SyntaxHighligtingTools.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation
import Highlightr
import UIKit

public class Highlighter {
    static let shared = Highlighter()
    private var highlightr: Highlightr?
    private init() {
        self.highlightr = Highlightr()
        highlightr?.setTheme(to: "googlecode")
    }

    func highlight(_ text: String, inBook book: (any BookMetadatable)?) -> [NSAttributedString] {
        guard let highlightr = highlightr else { return [] }
        var guessedLanguage: String? = nil

        if let book = book {
            for lang in HighlighterLanguages {
                if book.title.lowercased().contains(lang) {
                    guessedLanguage = lang
                    break
                }
            }
        }

        let languages = (guessedLanguage != nil ? [guessedLanguage] : []) + ["bash", "xml", "html"]

        return languages.map { lang in
            highlightr.highlight(text, as: lang) ?? NSAttributedString(string: text)
        }
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
        "zephir",
    ]
