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
    var books: [LocalBook] = []
    
    let fetcher = LocalBookFetcher()
    public init() {}

    func fetch() async {
        await MainActor.run {
            books = fetcher.fetch()
        }
    }
    
}
