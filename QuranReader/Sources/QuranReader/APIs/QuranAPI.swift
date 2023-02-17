//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import Tools

struct Verse: Codable {
    let chapter: Int
    let verse: Int
    let text: String
}

struct QuranEdition: Codable {
    let name: String
    let author: String
    let language: String
    let direction: String
    let source: String
    let comments: String
    let link: String
    let linkmin: String

}

class QuranAPI {
    private init() {
        
    }
    
    static let shared = QuranAPI()
    
    let apiRoot = "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/"

    let isMin = true
    var minSuffix: String {
        get {
            isMin ? ".min" : ""
        }
    }
    
    func url(path:String) -> URL {
        return URL(string: "\(apiRoot)\(path)\(minSuffix).json")!
    }
    
    func fetchVerse(_ edition:QuranEdition, chapter: Int, verse: Int) async throws -> Verse {
        let url = url(path: "editions/\(edition.name)/\(chapter)/\(verse)")
        let resp: Verse = try await fetchJSONDecodableAPI(url: url)
        return resp
    }
    
    func fetchEditions() async throws -> [QuranEdition] {
        let url = url(path: "editions")
        let resp: [String:QuranEdition] = try await fetchJSONDecodableAPI(url: url)
        return resp.map { $0.value }
    }
}
