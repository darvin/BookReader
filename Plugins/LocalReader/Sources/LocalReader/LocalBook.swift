//
//  LocalBook.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import Foundation
import Tools
import Protocols



public struct LocalBook: Codable, Identifiable {
    public var id: UUID = UUID()
    public var url: URL
    
    public init(url: URL) {
        self.id = UUID()
        self.url = url
    }
}


extension LocalBook: BookPDFable {
    public var pdfURL: URL? {
        return url
    }

    static func thumbnailURL(for url: URL) -> URL {
        let fileName = url.lastPathComponent.replacingOccurrences(of: ".pdf", with: ".jpg")

        return URL(fileURLWithPath: url.deletingLastPathComponent().path + "/." + fileName)
    }
}
extension LocalBook: HashableSynthesizable {}

extension LocalBook: BookMetadatable {
    public var author: String? {
        nil
    }
    
    public var narrator: String? {
        nil
    }
    
    public var language: String? {
        nil
    }
    
    public var translator: String? {
        nil
    }
    
    public var title: String {
        let t = (url.lastPathComponent as NSString).deletingPathExtension
        return t
    }


    public var thumbnailURL: URL {
        return Self.thumbnailURL(for: url)
    }

}

