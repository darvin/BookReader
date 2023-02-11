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
        return URL(string: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")!
        
    }
    
    
}
