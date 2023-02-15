//
//  TelegramBook.swift
//  BookReader
//
//  Created by standard on 2/15/23.
//

import Foundation
import Books


public struct TelegramBook: Codable, Identifiable {
    public var id: UUID = UUID()
    var url: URL
}

extension TelegramBook: Books.BookPDFable {
    public var pdfURL: URL? {
        return url
    }

    static func thumbnailURL(for url: URL) -> URL {
        let fileName = url.lastPathComponent.replacingOccurrences(of: ".pdf", with: ".jpg")

        return URL(fileURLWithPath: url.deletingLastPathComponent().path + "/." + fileName)
    }
}
extension TelegramBook: Books.HashableSynthesizable {}

extension TelegramBook: Books.BookMetadatable {
    public var title: String {
        let t = (url.lastPathComponent as NSString).deletingPathExtension
        return t
    }

    public var author: String {
        return "Unknown"
    }

    public var thumbnailURL: URL {
        return Self.thumbnailURL(for: url)
    }

}
