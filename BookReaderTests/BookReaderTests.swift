//
//  BookReaderTests.swift
//  BookReaderTests
//
//  Created by standard on 2/8/23.
//

import XCTest
import BookReader
import Algorithms

final class BookReaderTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testBookFetching() async throws {
        let g = GutenFetcher()

        let books = g.fetchBooks()
        var emojisIterator = ["📓", "📔", "📗", "📘", "📙", "📕", "📒"].cycled().makeIterator()
        var indexIterator = (1...5000).makeIterator()

        print("📚 Fetching bunch of books ")
        
        for try await book in books {
            let emoji = emojisIterator.next()!
            guard let i = indexIterator.next() else {
               break
            }
            print("          \(book), // \(emoji) Book #\(i)")
        }
    }


}
