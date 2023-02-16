//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//
import Tools
import Foundation

struct RecitationFolder: Codable {
    let subfolder: String
    let name: String
    let bitrate: String
}


struct RecitationsResponce: Decodable {
    let ayahCount: [Int]
    let recitationFolders: [RecitationFolder]
    
  private enum KnownCodingKeys: CodingKey, CaseIterable {
    case ayahCount

    static func doesNotContain(_ key: RecitationsResponce.DynamicCodingKeys) -> Bool {
      !Self.allCases.map(\.stringValue).contains(key.stringValue)
    }
  }

  struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    init?(stringValue: String) {
      self.stringValue = stringValue
    }

    // not used here, but a protocol requirement
    var intValue: Int?
    init?(intValue: Int) {
      return nil
    }
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: KnownCodingKeys.self)
      self.ayahCount = try container.decode([Int].self, forKey: .ayahCount)

    var recitationFolders:[RecitationFolder] = []
    let extraContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)

    for key in extraContainer.allKeys where KnownCodingKeys.doesNotContain(key) {
    let decoded = try extraContainer.decode(RecitationFolder.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
    recitationFolders.append(decoded)
    }
    self.recitationFolders = recitationFolders
    }
}

class EveryAyahAPI {
    let apiRoot = "https://everyayah.com/"

    
    func url(path:String) -> URL {
        return URL(string: "\(apiRoot)\(path)")!
    }
    
    func fetchReciters() async throws -> [RecitationFolder] {
        let url = url(path: "data/recitations.js")
        let resp: RecitationsResponce = try await fetchJSONDecodableAPI(url: url)
        
        
        return resp.recitationFolders
    }
}
