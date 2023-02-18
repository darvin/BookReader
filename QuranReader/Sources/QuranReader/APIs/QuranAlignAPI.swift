//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation

import Tools

public struct AyahRecitationSegment: Codable {
    public let indexStart: Int
    public let indexEnd: Int
    public let msStart: Int
    public let msEnd: Int

}

extension AyahRecitationSegment: Equatable {
    
}

public struct AyahRecitationAlignment: Codable {
    public let ayah: Int
    public let segments: [AyahRecitationSegment]
    public let surah: Int
    
    
    private enum CodingKeys: CodingKey, CaseIterable {
        case ayah
        case segments
        case surah
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ayah = try container.decode(Int.self, forKey: .ayah)
        self.surah = try container.decode(Int.self, forKey: .surah)
        
        let segmentsRaw = try container.decode([[Int]].self, forKey: .segments)
        
        self.segments = segmentsRaw.flatMap({ (rawSegment: [Int]) in
            AyahRecitationSegment(
                indexStart: rawSegment[0],
                indexEnd: rawSegment[1],
                msStart: rawSegment[2],
                msEnd: rawSegment[3])
        })
        
    }

}

extension AyahRecitationAlignment: Comparable {
    public static func == (lhs: AyahRecitationAlignment, rhs: AyahRecitationAlignment) -> Bool {
        return (lhs.surah, lhs.ayah) ==
          (rhs.surah, rhs.ayah)
    }
    
    public static func < (lhs: AyahRecitationAlignment, rhs: AyahRecitationAlignment) -> Bool {
        return (lhs.surah, lhs.ayah) <
          (rhs.surah, rhs.ayah)
    }
}

class QuranAlignAPI {
    let apiRoot = "https://raw.githubusercontent.com/darvin/quran-align-data-2016-11-24/main/"

    
    func url(path:String) -> URL {
        return URL(string: "\(apiRoot)\(path).json")!
    }
    
    func fetch(for recitation:QuranRecitation) async throws -> [AyahRecitationAlignment] {
        let url = url(path: recitation.subfolder)
        let resp: [AyahRecitationAlignment] = try await fetchJSONDecodableAPI(url: url)
        
        let sorted = resp.sorted()
        return sorted
    }
}
