//
//  GutenBook.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation


struct GutenResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [GutenBook]
    
}

struct GutenAuthor: Codable {
    let name: String
    let birth_year: Int?
    let death_year: Int?
    
}

enum GutenMediaType: String, Codable {
    case text = "Text"
    case sound = "Sound"
    case stillImage = "StillImage"
    case dataset = "Dataset"
    case collection = "Collection"
}


enum GutenFormat: String, Codable {
    case rdf = "application/rdf+xml"
    case text = "text/plain"
    case jpeg = "image/jpeg"
    case octetStream = "application/octet-stream"
    case html = "text/html"
    case epub = "application/epub+zip"
    case mobi = "application/x-mobipocket-ebook"
}

public struct GutenBook: Codable, BookMetadatable {
    let id: Int
    let title: String
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
