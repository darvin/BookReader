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

    public func fetchBooks(urlString: String = "http://gutendex.com/books/") -> AsyncThrowingStream<GutenBook, Error> {
        return AsyncThrowingStream { continuation in
            Task {
                var currentPageUrl = urlString
                while (true) {
                    do {
                        let url = URL(string: currentPageUrl)!
                        
                        let gutenResp: GutenResponse = try await fetchJSONDecodableAPI(url: url)
                        for book in gutenResp.results {
                            continuation.yield(book)
                        }
                        
                        guard let nextPageUrl = gutenResp.next else {
                            continuation.finish(throwing: nil)
                            break
                        }
                        currentPageUrl = nextPageUrl
                    } catch {
                        continuation.finish(throwing: error)
                        break
                    }
                }
            }
        }

    }
}
