//
//  Bookshelfable.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation

public protocol Bookshelfable: ObservableObject {
    associatedtype Book: BookMetadatable & BookPDFable
    var books: [Book] { get }
}
