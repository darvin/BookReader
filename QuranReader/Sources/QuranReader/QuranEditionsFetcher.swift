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
        return AsyncThrowingStream { continuation in
            Task {
                do {
                    
                    let editions: [EditionResponse] = try await quranApi.fetchEditions()
                    let allReciters: [RecitationFolder] = try await everyAyahApi.fetchReciters()

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
                    
                    let arabicTransliteration = editions.filter { e in
                        e.language == "Arabic" &&
                        e.author == "Quran Transliteration"
                    }

                    
                    print("Fetched Qurans: reciters: \(reciters.count) nonArabic: \(nonArabic.count) nonArabicTranslit: \(nonArabicTranslit.count)   arabicTranslit: \(arabicTransliteration.count) ")
                    //                    continuation.yield(book)
                    //                    continuation.finish(throwing: nil)
                } catch {
                    continuation.finish(throwing: error)
                }

            }
        }

    }

}
