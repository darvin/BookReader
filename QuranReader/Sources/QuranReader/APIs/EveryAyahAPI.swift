//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//
import Tools
import Foundation

struct QuranRecitation: Codable {
    let subfolder: String
    let name: String
    let bitrate: String
}


struct RecitationsResponce: Decodable {
    let ayahCount: [Int]
    let recitationFolders: [QuranRecitation]
    
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

    var recitationFolders:[QuranRecitation] = []
    let extraContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)

    for key in extraContainer.allKeys where KnownCodingKeys.doesNotContain(key) {
    let decoded = try extraContainer.decode(QuranRecitation.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
    recitationFolders.append(decoded)
    }
    self.recitationFolders = recitationFolders
    }
}

class EveryAyahAPI {
    let apiRoot = "https://everyayah.com/"

    private init() {
        
    }
    
    static let shared = EveryAyahAPI()

    func url(path:String) -> URL {
        return URL(string: "\(apiRoot)\(path)")!
    }
    
    func fetchReciters() async throws -> [QuranRecitation] {
        let url = url(path: "data/recitations.js")
        let resp: RecitationsResponce = try await fetchJSONDecodableAPI(url: url)
        
        
        return resp.recitationFolders
    }
    
    func url(recitation: QuranRecitation, verseInChapter:Int, chapter:Int) -> URL {
        let filename = String(format: "%03d%03d", chapter,verseInChapter)
        let url = url(path: "data/\(recitation.subfolder)/\(filename).mp3")
        return url
    }
}
