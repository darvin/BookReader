//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation



class VerseViewModel: ObservableObject {
    let arabic: String?
    
    let arabicTranslit: String?

    let translation: String?

    let translationTranslit: String?
    
    let verse: Int
    
    let chapter: Int
    
    let book: QuranBook

    @Published
    var playingNowWordIndex: Int?

    
    init(book:QuranBook,
        verse: Int,
         chapter: Int,
        arabic: String,
         arabicTranslit: String? = nil,
         translation: String? = nil,
         translationTranslit: String? = nil) {
        self.book = book
        self.verse = verse
        self.chapter = chapter
        self.arabic = arabic
        self.arabicTranslit = arabicTranslit
        self.translation = translation
        self.translationTranslit = translationTranslit
    }

        
    

}
