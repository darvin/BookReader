//
//  LocalBook.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import Foundation

public struct LocalBook: Codable, Identifiable {
    public var id: UUID = UUID()
    var url: URL
}


extension LocalBook: BookPDFable {
    var pdfURL: URL? {
        return url
    }
    
    static func thumbnailURL(for url:URL) -> URL {
        let fileName = url.lastPathComponent.replacingOccurrences(of: ".pdf", with: ".jpg")

        return URL(fileURLWithPath: url.deletingLastPathComponent().path + "/." + fileName)
    }
}
extension LocalBook: HashableSynthesizable { }


extension LocalBook: BookMetadatable {
    var title: String {
        let t = (url.lastPathComponent as NSString).deletingPathExtension
        return t
    }
    

    
    var author: String {
        return "Unknown"
    }
    
    var thumbnailURL: URL {
        return Self.thumbnailURL(for: url)
    }
    
    
}
