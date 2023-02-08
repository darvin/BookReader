//
//  Bookshelfable.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation

protocol Bookshelfable: ObservableObject {
    associatedtype Book: BookMetadatable
    var books: [Book] { get }
}
