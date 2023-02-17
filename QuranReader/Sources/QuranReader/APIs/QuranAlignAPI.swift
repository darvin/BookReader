//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation

import Tools

struct AyahRecitationAlignment: Codable {
    let ayah: Int
    let segments: [[Int]]
    let surah: Int
}

class QuranAlignAPI {
    let apiRoot = "https://raw.githubusercontent.com/darvin/quran-align-data-2016-11-24/main/"

    
    func url(path:String) -> URL {
        return URL(string: "\(apiRoot)\(path)")!
    }
    
    func fetch(for recitation:QuranRecitation) async throws -> [AyahRecitationAlignment] {
        let url = url(path: recitation.subfolder)
        let resp: [AyahRecitationAlignment] = try await fetchJSONDecodableAPI(url: url)
        
        
        return resp
    }
}
