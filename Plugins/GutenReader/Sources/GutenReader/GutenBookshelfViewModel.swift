//
//  GutenBookshelfViewModel.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation
import SwiftUI
import Protocols
import Combine

public class GutenBookshelfViewModel: Bookshelfable {
    @Published private(set) public var canLoadNextPage = true
    
    @Published private(set) public var books = [Book]()

    public typealias Book = GutenBook

    public init() {}

    
    private var subscriptions = Set<AnyCancellable>()
    
    public func fetchNextPageIfPossible() {
        guard canLoadNextPage else { return }
        let fetch = (nextPageURL != nil) ? GutenFetcher.shared.fetchBooks(url: nextPageURL!) : GutenFetcher.shared.fetchBooks(query: [:])
        
        fetch.sink(receiveCompletion: onReceive,
                  receiveValue: onReceive)
            .store(in: &subscriptions)
    }
    
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure:
            canLoadNextPage = false
        }
    }

    private func onReceive(_ result: ([Book], URL?)) {
        let (books, nextPageURL) = result
        self.books += books
        self.nextPageURL = nextPageURL
        canLoadNextPage = nextPageURL != nil
    }

    private var nextPageURL: URL?

}
