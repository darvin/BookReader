//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import Tools

struct EditionResponse: Codable {
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
    let apiRoot = "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/"

    let isMin = false
    var minSuffix: String {
        get {
            isMin ? ".min" : ""
        }
    }
    
    func url(path:String) -> URL {
        return URL(string: "\(apiRoot)\(path)\(minSuffix).json")!
    }
    
    func fetchEditions() async throws -> [EditionResponse] {
        let url = url(path: "editions")
        let resp: [String:EditionResponse] = try await fetchJSONDecodableAPI(url: url)
        return resp.map { $0.value }
    }
}
