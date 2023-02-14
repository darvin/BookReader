//
//  Bookshelf.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import Foundation

struct Bookshelf: Hashable, Identifiable {
    var id: Int
    var name: String

    static let local = Bookshelf(id: 0, name: "Local")
    static let gutenberg1 = Bookshelf(id: 1, name: "Gutenberg 1")
    static let gutenberg2 = Bookshelf(id: 2, name: "Gutenberg 2")

}
