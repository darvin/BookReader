//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation
import SwiftUI

extension String {
    var firstWords: String? {
        let maxChars = 15
        let words = self.split(separator: " ")
        var result = ""
        var currentLength = 0
        
        for word in words {
            if currentLength + word.count + 1 <= maxChars {
                // Add the word to the result and update the current length
                result += word + " "
                currentLength += word.count + 1
            } else {
                // Stop adding words if the maximum length is reached
                break
            }
        }
        
        // Remove the trailing space and return the result
        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


class QuranCoverViewModel: ObservableObject {
    @Published
    var isReady: Bool = false
    
    @Published
    var arabic: String?
    
    @Published
    var arabicTranslit: String?

    @Published
    var translation: String?

    @Published
    var translationTranslit: String?

    let color: UIColor
    
    let book: QuranBook

    init(book: QuranBook) {
        self.book = book
        color = QuranBook.narratorCoverColors[book.recitation.subfolder]!
    }
    
    func load() async {
        do {

            let c = 1
            let v = 1
            let arabicVerse = try await QuranAPI.shared.fetchVerse(book.arabic, chapter: c, verse: v)
            let arabicTranliterationVerse = (book.arabicTrasliteration != nil) ? try await QuranAPI.shared.fetchVerse(book.arabicTrasliteration!, chapter: c, verse: v) : nil
            let translationVerse = (book.translation != nil) ? try await QuranAPI.shared.fetchVerse(book.translation!, chapter: c, verse: v) : nil
            let translationTransliterationVerse = (book.translationTransliteration != nil) ? try await QuranAPI.shared.fetchVerse(book.translationTransliteration!, chapter: c, verse: v) : nil
            
            await MainActor.run {
                arabic = arabicVerse.text.firstWords
                arabicTranslit = arabicTranliterationVerse?.text.firstWords
                translation = translationVerse?.text.firstWords
                translationTranslit = translationTransliterationVerse?.text.firstWords
                isReady = true
            }
            
        } catch {
            print("Error fecthing cover: \(error)")
        }
        
        

    }
}
