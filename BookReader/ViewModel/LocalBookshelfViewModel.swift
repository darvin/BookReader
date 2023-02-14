//
//  LocalBookshelfViewModel.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import Foundation
import SwiftUI

class LocalBookshelfViewModel: Bookshelfable {
    typealias Book = LocalBook

    @Published
    var books: [Book] = []

    let fetcher = LocalBookFetcher()
    let thumbnailGenerator = PDFThumbnailGenerator()

    public init() {}

    func fetch() async {
        await MainActor.run {
            books = []
        }
        let booksAsyncSequence = fetcher.fetch()
        do {
            for try await book in booksAsyncSequence {
                let _ = try await thumbnailGenerator.generateAndSaveThumbnailAsync(for: book.url)
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
