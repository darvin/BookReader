//
//  GutenBookshelfViewModel.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation
import SwiftUI

class GutenBookshelfViewModel : Bookshelfable {
    public init() {}

    let api = GutenFetcher()
    
    @Published
    var books = [GutenBook]()
    
    func getFirstHundred() async {
        await MainActor.run {
            books = []
        }
        let booksAsyncSequence = await api.fetchBooks(limitBooks: 30)
        do {
            for try await book in booksAsyncSequence {
                await MainActor.run {
                    books.append(book)
                    print("BOOKS: \(books.count)")
                }
            }
        } catch {
            print("error: ", error)
        }
    }
    
    func search(searchTerm: String) {
        
    }
}
