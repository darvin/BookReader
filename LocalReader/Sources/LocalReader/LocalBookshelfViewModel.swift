//
//  LocalBookshelfViewModel.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import Foundation
import SwiftUI
import Protocols
import UITools

public class LocalBookshelfViewModel: Bookshelfable {
    public var canLoadNextPage: Bool = true
    
    public func fetchNextPageIfPossible() {
        
    }
    public typealias Book = LocalBook

    @Published
    public var books: [Book] = []

    let fetcher = LocalBookFetcher()
    let thumbnailGenerator = PDFThumbnailGenerator()

    public init() {}

    public func fetch() async {
        await MainActor.run {
            books = []
        }
        let booksAsyncSequence = fetcher.fetch()
        do {
            for try await book in booksAsyncSequence {
                let _ = try await thumbnailGenerator.generateAndSaveThumbnailAsync(for: book.url, thumbnailURL:LocalBook.thumbnailURL(for: book.url))
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

}
