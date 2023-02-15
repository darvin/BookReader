//
//  TelegramBookshelfViewModel.swift
//  BookReader
//
//  Created by standard on 2/15/23.
//

import Foundation
import SwiftUI

class TelegramBookshelfViewModel: Bookshelfable {
    typealias Book = TelegramBook

    @Published
    var books: [Book] = []

    @Published
    var showingLoginScreen: Bool = true
    
    public init() {}

    func fetch() async {
        await MainActor.run {
            books = []
        }
//        TelegramClient.shared.activate()
//        let chats = await TelegramClient.shared.chats()
//        
        

    }

}
