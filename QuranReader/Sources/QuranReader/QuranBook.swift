//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import Protocols


public struct QuranBook: Codable, Identifiable {
    public var id: UUID = UUID()
    public var url: URL
    
    public init(url: URL) {
        self.id = UUID()
        self.url = url
    }
}

extension QuranBook: HashableSynthesizable {}

extension QuranBook: BookMetadatable {
    public var title: String {
        let t = (url.lastPathComponent as NSString).deletingPathExtension
        return t
    }

    public var author: String {
        return "Unknown"
    }

    public var thumbnailURL: URL {
        return URL(string:"http://no-image.com")!
    }

}
