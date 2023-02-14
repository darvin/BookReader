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

    public init() {}

    func fetch() async {
        await MainActor.run {
            books = []
        }

    }

}
