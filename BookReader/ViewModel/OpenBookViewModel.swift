//
//  BookViewModel.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import Foundation
import os.log

class OpenBookViewModel: ObservableObject {
    @Published var book: any BookPDFable
    @Published var progress: Float = 0
    @Published var pdfData: Data?

    let logger = Logger(subsystem: "📖 OpenBookViewModel", category: "main")

    // Custom URL cache with 1 GB disk storage
    lazy var cache: URLCache = {
        let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let diskCacheURL = cachesURL.appendingPathComponent("DownloadCache")
        let cache = URLCache(
            memoryCapacity: 100_000_000,
            diskCapacity: 1_000_000_000,
            directory: diskCacheURL
        )
        logger.info("Cache path: \(diskCacheURL.path)")
        return cache
    }()

    // Custom URLSession that uses our cache
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.urlCache = cache
        return URLSession(configuration: config)
    }()

    public init(book: any BookPDFable) {
        logger.debug("OpenBookViewModel created ")

        self.book = book
    }

    private func loadData(url: URL) async -> Data? {
        if url.scheme == "file" {
            return await loadLocalData(url: url)
        }
        else {
            return await loadRemoteData(url: url)
        }
    }

    private func loadLocalData(url: URL) async -> Data? {
        do {
            return try Data(contentsOf: url)
        }
        catch {
            print("loading file error")
            return nil
        }
    }

    private func loadRemoteData(url: URL) async -> Data? {
        do {
            let request = URLRequest(url: url)
            if let cachedResponse = self.cache.cachedResponse(for: request) {
                logger.debug("🌐 FROM CACHE \(url)")

                return cachedResponse.data
            }
            else {
                logger.debug("🌐 LOADING \(url)")

                let (data, response) = try await session.data(for: request)
                if self.cache.cachedResponse(for: request) == nil,
                    let data = try? Data(contentsOf: url, options: [.mappedIfSafe])
                {
                    self.cache.storeCachedResponse(
                        CachedURLResponse(response: response, data: data),
                        for: request
                    )
                }
                return data
            }

        }
        catch {
            logger.error("error: \(error)")
            return nil
        }
    }

    public func load() async {
        guard let url = book.pdfURL else { return }
        logger.info("  🌐 LOADING 🌐 \(url)")
        if let data = await loadData(url: url) {
            await MainActor.run {
                pdfData = data
            }
        }
    }

}
