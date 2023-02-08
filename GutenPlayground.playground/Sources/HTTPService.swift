//
//  HTTPService.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation

func fetchJSONDecodableAPI<D: Decodable>(url: URL) async throws -> D {
    let task = Task { () -> D in
        let data = try Data(contentsOf: url)
        let decodedData = try JSONDecoder().decode(D.self, from: data)
        return decodedData
    }
    return try await task.value
}
