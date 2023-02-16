//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation


class QuranEditionsFetcher {
    let api = QuranAPI()

    
    public func fetchBooks() -> AsyncThrowingStream<QuranBook, Error> {
        return AsyncThrowingStream { continuation in
            Task {
                do {
                    
                    let editions: EditionsResponse = try await api.fetchEditions()
                    
                    print(editions)
                    //                    continuation.yield(book)
                    //                    continuation.finish(throwing: nil)
                } catch {
                    continuation.finish(throwing: error)
                }

            }
        }

    }

}
