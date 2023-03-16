//
//  TelegramBookshelfViewModel.swift
//  BookReader
//
//  Created by standard on 2/15/23.
//

import Foundation
import SwiftUI
import Protocols

public class TelegramBookshelfViewModel: Bookshelfable {
    public var canLoadNextPage: Bool = true
    
    public func fetchNextPageIfPossible() {
    }
    
    public typealias Book = TelegramBook

    @Published
    public var books: [Book] = []

    @Published
    var showingLoginScreen: Bool = true
    
    public init() {}

    public func fetch() async {
        await MainActor.run {
            books = []
        }
//        TelegramClient.shared.activate()
//        let chats = await TelegramClient.shared.chats()
//        
        

    }

}
