//
//  BookViewModel.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import Foundation

class OpenBookViewModel : ObservableObject {
    @Published var book: any BookPDFable
    @Published var progress: Float = 0
    @Published var pdfData: Data?

    public init(book: any BookPDFable) {
        print("📖 OpenBookViewModel created for \(book)")

        self.book = book
    }
    
    public func load() async {
        guard let url = book.pdfURL else { return }
        do {
            print("📖  🌐 LOADING 🌐 \(url)")
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run {
                pdfData = data

            }

        } catch {
            print("error: \(error)")
        }
    }

    
    
}
