//
//  String_ProgrammingLanguage.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation
extension String {
    
    func startsWithCommentSymbol() -> Bool {
        let symbols = ["#", "//", "/*"]
        for commmentSymbol in symbols {
            if hasPrefix(commmentSymbol) {
                return true
            }
        }
        return false
    }

    func looksLikeProgrammingLanguage() -> Bool {
        let characters = Array(self)
        let length = characters.count
        
        // Check if the string contains any uppercase characters, which are often used in programming languages
//        let hasUppercaseCharacters = characters.reduce(false) { (result, character) -> Bool in
//            return result || character.isUppercase
//        }
        
        // Check if the string contains digits, which are often used in programming languages
        let hasDigits = characters.reduce(false) { (result, character) -> Bool in
            return result || character.isNumber
        }
        
        // Check if the string contains underscore, which is a commonly used symbol in programming languages
        let hasUnderscore = self.contains("_")
        
        // Check if the string has a balanced number of curly braces, which are used for control structures and defining scopes in many programming languages
        var numberOfOpenCurlyBraces = 0
        var numberOfCloseCurlyBraces = 0
        for character in characters {
            if character == "{" {
                numberOfOpenCurlyBraces += 1
            } else if character == "}" {
                numberOfCloseCurlyBraces += 1
            }
        }
        let hasBalancedCurlyBraces = numberOfOpenCurlyBraces > 1 || numberOfCloseCurlyBraces > 1
        
        // Check if the string has a balanced number of square brackets, which are used for array indexing and array comprehensions in many programming languages
        var numberOfOpenSquareBrackets = 0
        var numberOfCloseSquareBrackets = 0
        for character in characters {
            if character == "[" {
                numberOfOpenSquareBrackets += 1
            } else if character == "]" {
                numberOfCloseSquareBrackets += 1
            }
        }
        let hasBalancedSquareBrackets = numberOfOpenSquareBrackets > 1 || numberOfCloseSquareBrackets > 1
        
        // Return true if any of the checks indicate that the string looks like a programming language
        let isProgramming = //hasUppercaseCharacters ||
         hasDigits || hasUnderscore || hasBalancedCurlyBraces || hasBalancedSquareBrackets || startsWithCommentSymbol()
        
        print("\(isProgramming)  '\(self)' \(hasDigits) || \(hasUnderscore) || \(hasBalancedCurlyBraces) || \(hasBalancedSquareBrackets) || \(startsWithCommentSymbol())()")
        return isProgramming
    }
}
