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
    
    
    
    var recitation: QuranRecitation
    var translation: QuranEdition?
    var translationTransliteration: QuranEdition?
    var arabicTrasliteration: QuranEdition?
    
}

extension QuranBook: HashableSynthesizable {}

extension QuranBook: BookMetadatable {
    public var author: String? {
        nil
    }
    
    public var narrator: String? {
        recitation.name
    }
    
    public var language: String? {
        translation?.language
    }
    
    public var translator: String? {
        translation?.author
    }
    
    var arabicTransliterationSuffix: String {
        if let t = arabicTrasliteration {
            return " AR "
        } else {
            return ""
        }
    }
    
    var translationTransliterationSuffix: String {
        if let t = translationTransliteration {
            return " TR "
        } else {
            return ""
        }
    }

    
    var titleSuffix: String {
        "\(arabicTransliterationSuffix)\(translationTransliterationSuffix)"
    }
    
    public var title: String {
        "Quran\(titleSuffix)"
    }

    public var thumbnailURL: URL {
        return URL(string:"http://no-image.com")!
    }

}
