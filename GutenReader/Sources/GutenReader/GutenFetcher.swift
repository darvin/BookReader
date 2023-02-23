//
//  GutenFetcher.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Combine
import Foundation
import Tools


public class GutenFetcher {
    public static var shared = GutenFetcher()
    private init() {}

    public func fetchBooks(query: [String: String] = [String: String]())
        -> AnyPublisher<([GutenBook], URL?), Error>
    {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "gutendex.com"
        components.path = "/books/"
        //        let allowedCharacters = CharacterSet.urlQueryAllowed.subtracting(CharacterSet(charactersIn: "/"))

        components.queryItems = query.map({ (key: String, value: String) in
            return URLQueryItem(name: key, value: value)  //.addingPercentEncoding(withAllowedCharacters: allowedCharacters))
        })
        let url = components.url!
        let fixedURL = URL(string: "\(url.absoluteString)&mime_type=application%2Fpdf")!

        return fetchBooks(url: fixedURL)
    }

    public func fetchBooks(url: URL) -> AnyPublisher<([GutenBook], URL?), Error>  {
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { print(NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue)!) })
            .tryMap {
                let r = try JSONDecoder().decode(GutenResponse.self, from: $0.data)
                return (r.results, (r.next != nil) ? URL(string: r.next!) : nil)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()


    }
}
