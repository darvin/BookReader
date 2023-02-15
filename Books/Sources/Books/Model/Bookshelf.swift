//
//  Bookshelf.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import Foundation

public struct Bookshelf: Hashable, Identifiable {
    public var id: Int
    public var name: String

    public static let local = Bookshelf(id: 0, name: "Local")
    public static let gutenberg1 = Bookshelf(id: 1, name: "Gutenberg 1")
    public static let gutenberg2 = Bookshelf(id: 2, name: "Gutenberg 2")
    public static let telegram = Bookshelf(id: 3, name: "Telegram")

}
