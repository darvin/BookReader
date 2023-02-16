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

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
