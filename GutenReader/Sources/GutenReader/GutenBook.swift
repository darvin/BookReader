//
//  GutenBook.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation
import Protocols

public struct GutenBook: Codable, Identifiable {
    public let id: Int
    public let title: String
    let authors: [GutenAuthor]
    let translators: [GutenAuthor]
    let subjects: [String]
    let bookshelves: [String]
    let formats: [String: String]
    let languages: [String]
    let copyright: Bool
    let media_type: GutenMediaType
    let download_count: Int
}

extension GutenBook: BookPDFable {
    public var pdfURL: URL? {
        guard let pdfURLString = formats[GutenFormat.pdf.rawValue] else { return nil }
        return URL(string: pdfURLString)

    }

}

extension GutenBook: BookMetadatable {

    public static func == (lhs: GutenBook, rhs: GutenBook) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public var author: String {
        return authors.map { author in
            author.name
        }.joined(separator: ", ")
    }

    public var thumbnailURL: URL {
        guard let urlString = formats[GutenFormat.jpeg.rawValue] else {
            return URL(string: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")!
        }
        return URL(string: urlString)!
    }

}

