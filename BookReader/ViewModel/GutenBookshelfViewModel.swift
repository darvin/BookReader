//
//  GutenBookshelfViewModel.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation
import SwiftUI

class GutenBookshelfViewModel: Bookshelfable {
    typealias Book = GutenBook

    public init() {}

    let api = GutenFetcher()

    @Published
    var books = [Book]()

    func getFirstHundred() async {
        await fetchBooks()
    }

    func getAnotherHundred() async {
        await fetchBooks(query: [
            "page": "30"
        ])

    }

    func fetchBooks(query: [String: String] = [String: String](), limitBooks: Int = 100) async {
        await MainActor.run {
            books = []
        }
        let booksAsyncSequence = await api.fetchBooks(query: query, limitBooks: limitBooks)
        do {
            for try await book in booksAsyncSequence.filter({ book in
                book.formats[GutenFormat.pdf.rawValue] != nil
            }) {
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
