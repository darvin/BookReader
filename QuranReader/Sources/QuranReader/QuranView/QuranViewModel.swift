//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation

public class QuranViewModel: ObservableObject {
    @Published
    var verseViewModel: VerseViewModel? = nil

    let book: QuranBook
    
    private var arabic = [Verse]()
    private var arabicTranslit = [Verse]()
    private var translation = [Verse]()
    private var translationTranslit = [Verse]()
    private var recitationAligment = [AyahRecitationAlignment]()

    private let quranAligmentAPI = QuranAlignAPI()
    
    @Published
    var verseIndex: Int = 0 {
        didSet {
            updateState()
        }
    }
    
    private func updateState() {
        verseInChapterIndex = arabic[verseIndex].verse
        chapterIndex = arabic[verseIndex].chapter
        verseViewModel = makeVerseViewModel()
    }
    
    @Published
    var verseInChapterIndex: Int = 1
    
    @Published
    var chapterIndex: Int = 1

    @Published
    var isReady = false

    
    init(book: QuranBook,
         isReady: Bool = false) {
        self.book = book
        self.isReady = isReady
    }
    
    func arabicText() -> String {
        return arabic[verseIndex].text
    }
    
    func arabicTranliterationText() -> String? {
        guard verseIndex < arabicTranslit.count else { return nil }
        return arabicTranslit[verseIndex].text
    }
    
    func translationText() -> String? {
        guard verseIndex < translation.count else { return nil }
        return translation[verseIndex].text

    }
    func translationTranslitText() -> String? {
        guard verseIndex < translationTranslit.count else { return nil }
        return translationTranslit[verseIndex].text

    }

    
    private func makeVerseViewModel() -> VerseViewModel  {
        return VerseViewModel(verse: verseInChapterIndex,
                              chapter: chapterIndex,
                              arabic: arabicText(),
                              arabicTranslit: arabicTranliterationText(),
                              translation: translationText(),
                              translationTranslit: translationTranslitText())
    }
    
    
    func load() async {
        do {
            let arabicVerses = try await QuranAPI.shared.fetchVerses(book.arabic)
            let arabicTranliterationVerses = (book.arabicTrasliteration != nil) ? try await QuranAPI.shared.fetchVerses(book.arabicTrasliteration!) : []
            let translationVerses = (book.translation != nil) ? try await QuranAPI.shared.fetchVerses(book.translation!) : []
            let translationTransliterationVerses = (book.translationTransliteration != nil) ? try await QuranAPI.shared.fetchVerses(book.translationTransliteration!) : []
            
            recitationAligment = try await quranAligmentAPI.fetch(for: book.recitation)
            
            await MainActor.run {
                arabic = arabicVerses
                arabicTranslit = arabicTranliterationVerses
                translation = translationVerses
                translationTranslit = translationTransliterationVerses
                updateState()
                isReady = true
            }
            
        } catch {
            print("Error fecthing cover: \(error)")
        }
        
        

    }

}
