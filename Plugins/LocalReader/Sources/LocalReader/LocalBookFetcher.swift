//
//  LocalBookFetcher.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import Foundation

extension URL {
    var typeIdentifier: String? {
        (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier
    }
    var isPDF: Bool { typeIdentifier == "com.adobe.pdf" }
    var localizedName: String? {
        (try? resourceValues(forKeys: [.localizedNameKey]))?.localizedName
    }
    var hasHiddenExtension: Bool {
        get { (try? resourceValues(forKeys: [.hasHiddenExtensionKey]))?.hasHiddenExtension == true }
        set {
            var resourceValues = URLResourceValues()
            resourceValues.hasHiddenExtension = newValue
            try? setResourceValues(resourceValues)
        }
    }
}

class LocalBookFetcher {

    func fetch() -> AsyncThrowingStream<LocalBook, Error> {
        return AsyncThrowingStream { continuation in
            Task {
                do {
                    // Get the document directory url
                    let documentDirectory = try FileManager.default.url(
                        for: .documentDirectory,
                        in: .userDomainMask,
                        appropriateFor: nil,
                        create: true
                    )
                    print("documentDirectory", documentDirectory.path)
                    // Get the directory contents urls (including subfolders urls)
                    let directoryContents = try FileManager.default.contentsOfDirectory(
                        at: documentDirectory,
                        includingPropertiesForKeys: nil
                    )
                    print(
                        "directoryContents:",
                        directoryContents.map { $0.localizedName ?? $0.lastPathComponent }
                    )
                    for url in directoryContents {
                        print(url.localizedName ?? url.lastPathComponent)
                    }

                    // if you would like to hide the file extension
                    for var url in directoryContents {
                        url.hasHiddenExtension = true
                    }
                    for url in directoryContents {
                        print(url.localizedName ?? url.lastPathComponent)
                    }

                    directoryContents.filter(\.isPDF).forEach { url in
                        continuation.yield(LocalBook(url: url))
                    }
                    continuation.finish(throwing: nil)

                }
                catch {
                    continuation.finish(throwing: error)

                }
            }
        }
    }
}
