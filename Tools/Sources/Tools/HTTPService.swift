//
//  HTTPService.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation

enum ApiError: Error {
    case parseError
    case fetchError
}

public func fetchJSONDecodableAPI<D: Decodable>(url: URL) async throws -> D {
    let task = Task { () -> D in
        let urlRequest = URLRequest(url: url)
        print("//🌐 curl \(url)")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw ApiError.fetchError
        }

        do {
            let decodedData = try JSONDecoder().decode(D.self, from: data)
            return decodedData
        }
        catch let DecodingError.dataCorrupted(context) {
            print(context)
        }
        catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        }
        catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        }
        catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        }
        catch {
            print("error: ", error)
        }
        throw ApiError.parseError
    }
    return try await task.value
}
