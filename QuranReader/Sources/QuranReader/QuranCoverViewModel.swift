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


    
    init(book: QuranBook,
         isReady: Bool = false,
         arabic: String? = nil,
         arabicTranslit: String? = nil,
         translation: String? = nil,
         translationTranslit: String? = nil) {
        print("VIEW MODEL CONSTRUCTED FROM BOOK: \n \(book)")
        self.book = book
        self.isReady = isReady
        color = QuranBook.narratorCoverColors[book.recitation.subfolder]!
        self.arabic = arabic
        self.arabicTranslit = arabicTranslit
        self.translation = translation
        self.translationTranslit = translationTranslit
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
                arabic = arabicVerse.text
                arabicTranslit = arabicTranliterationVerse?.text
                translation = translationVerse?.text
                translationTranslit = translationTransliterationVerse?.text
                isReady = true
                print("VIEW MODEL FETCHED: \n\(self)(book:QuranBook.previewQurans[0]\n isReady:\(isReady),\n arabic:\"\(arabic ?? "nil")\",\n arabicTranslit:\"\(arabicTranslit ?? "nil")\",\n translation:\"\(translation ?? "nil")\",\n translationTranslit:\"\(translationTranslit ?? "nil")\" ),\n")
            }
            
        } catch {
            print("Error fecthing cover: \(error)")
        }
        
        

    }
}
