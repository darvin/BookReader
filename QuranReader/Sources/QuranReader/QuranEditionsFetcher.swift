//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation


class QuranEditionsFetcher {
    let quranApi = QuranAPI()
    let everyAyahApi = EveryAyahAPI()

    
    public func fetchBooks() -> AsyncThrowingStream<QuranBook, Error> {
        return AsyncThrowingStream { c in
            Task {
                do {
                    
                    let editions: [QuranEdition] = try await quranApi.fetchEditions()
                    let allReciters: [QuranRecitation] = try await everyAyahApi.fetchReciters()

                    let reciters = allReciters.filter { r in
                        QuranBook.narrarorIDs.contains(r.subfolder)
                    }
                    
                    let nonArabic = editions.filter { e in
                        e.language != "Arabic" &&
                        !e.name.hasSuffix("-la")
                    }
                    let nonArabicTranslit = editions.filter { e in
                        e.language != "Arabic" &&
                        e.name.hasSuffix("-la")
                    }
                    
                    let arabicTransliterations = editions.filter { e in
                        e.language == "Arabic" &&
                        e.author == "Quran Transliteration"
                    }
                    let arabicTransliteration = arabicTransliterations.first!

                    
                    print("Fetched Qurans: reciters: \(reciters.count) nonArabic: \(nonArabic.count) nonArabicTranslit: \(nonArabicTranslit.count)   arabicTranslit: \(arabicTransliterations.count) ")
                    
                    for reciter in reciters {
                        c.yield(QuranBook(recitation: reciter))
                        c.yield(QuranBook(recitation: reciter, arabicTrasliteration: arabicTransliteration))
                        for translation in nonArabic {
                            c.yield(QuranBook(recitation: reciter,
                                              translation:translation, arabicTrasliteration: arabicTransliteration))

                            let translationTransliteration = nonArabicTranslit.filter { t in
                                t.language == translation.language &&
                                t.author == translation.author
                            }.first
                            c.yield(QuranBook(recitation: reciter,
                                              translation:translation, translationTransliteration:translationTransliteration, arabicTrasliteration: arabicTransliteration))

                            
                        }
                    }
                    c.finish(throwing: nil)
                } catch {
                    c.finish(throwing: error)
                }

            }
        }

    }

}
