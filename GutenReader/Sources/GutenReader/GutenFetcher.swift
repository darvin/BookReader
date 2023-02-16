//
//  GutenFetcher.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Combine
import Foundation
import Tools

public actor GutenFetcher {
    public init() {}

    public func fetchBooks(query: [String: String] = [String: String](), limitBooks: Int = 100)
        -> AsyncThrowingStream<GutenBook, Error>
    {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "gutendex.com"
        components.path = "/books/"
        //        let allowedCharacters = CharacterSet.urlQueryAllowed.subtracting(CharacterSet(charactersIn: "/"))

        components.queryItems = query.map({ (key: String, value: String) in
            return URLQueryItem(name: key, value: value)  //.addingPercentEncoding(withAllowedCharacters: allowedCharacters))
        })
        let url = components.url!
        let fixedURL = URL(string: "\(url.absoluteString)&mime_type=application%2Fpdf")!

        return fetchBooks(url: fixedURL, limitBooks: limitBooks)
    }

    private func fetchBooks(url: URL, limitBooks: Int) -> AsyncThrowingStream<GutenBook, Error> {
        return AsyncThrowingStream { continuation in
            Task {
                var i = 0
                var currentPageUrl = url
                while true {
                    do {
                        let url = currentPageUrl

                        let gutenResp: GutenResponse = try await fetchJSONDecodableAPI(url: url)
                        for book in gutenResp.results {
                            i += 1
                            continuation.yield(book)

                        }
                        if i >= limitBooks {
                            continuation.finish(throwing: nil)
                            break
                        }

                        guard let nextPageUrl = gutenResp.next else {
                            continuation.finish(throwing: nil)
                            break
                        }

                        currentPageUrl = URL(string: nextPageUrl)!
                    }
                    catch {
                        continuation.finish(throwing: error)
                        break
                    }
                }
            }
        }

    }
}
