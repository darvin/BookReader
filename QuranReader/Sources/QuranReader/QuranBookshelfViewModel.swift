//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation



import Foundation
import SwiftUI
import Protocols

public class QuranBookshelfViewModel: Bookshelfable {
        
    public typealias Book = QuranBook

    public init() {}

    let fetcher = QuranEditionsFetcher()

    @Published
    public var books = [Book]()


    public func fetch() async {
        await MainActor.run {
            books = []
        }
        let booksAsyncSequence = fetcher.fetchBooks()
        do {
            for try await book in booksAsyncSequence {
                await MainActor.run {
                    books.append(book)
                    print("BOOKS: \(books.count)")
                }
            }
        }
        catch {
            print("error: ", error)
        }

    }

    func search(searchTerm: String) {

    }
}
