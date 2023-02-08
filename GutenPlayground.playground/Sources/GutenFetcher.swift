//
//  GutenFetcher.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation


import Foundation
import Combine


public class GutenFetcher {
    public init() {}

    public func fetchBooks() -> AsyncThrowingStream<GutenBook, Error> {
        return AsyncThrowingStream { continuation in
            Task {
                while (true) {
                    do {
                        let url = URL(string:"https://gutendex.com/books")!
                        
                        let gutenResp: GutenResponse = try await fetchJSONDecodableAPI(url: url)
                        for book in gutenResp.results {
                            continuation.yield(book)
                        }
                        
                        if gutenResp.next == "" {
                            continuation.finish(throwing: nil)
                            break
                        }
                    } catch {
                        continuation.finish(throwing: error)
                        break
                    }
                }
            }
        }

    }
}
