//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import Tools
struct EditionsResponse: Codable {
    
}

let apiRoot = "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/"
class QuranAPI {
    let isMin = false
    var minSuffix: String {
        get {
            isMin ? ".min" : ""
        }
    }
    
    func url(path:String) -> URL {
        return URL(string: "\(apiRoot)\(path)\(minSuffix).json")!
    }
    
    func fetchEditions() async throws -> EditionsResponse {
        let url = url(path: "editions")
        let resp: EditionsResponse = try await fetchJSONDecodableAPI(url: url)
        return resp
    }
}
