//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
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
    case image = "Image"
}

enum GutenFormat: String, Codable {
    case rdf = "application/rdf+xml"
    case text = "text/plain"
    case jpeg = "image/jpeg"
    case octetStream = "application/octet-stream"
    case html = "text/html"
    case epub = "application/epub+zip"
    case pdf = "application/pdf"
    case mobi = "application/x-mobipocket-ebook"
}
