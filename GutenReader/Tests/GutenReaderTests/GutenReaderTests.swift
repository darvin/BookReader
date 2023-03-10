import XCTest
@testable import GutenReader

final class GutenReaderTests: XCTestCase {

    
    func testBookFetching() async throws {
        let g = GutenFetcher()

        let books = await g.startFetchingBooks()
        var emojisIterator = ["📓", "📔", "📗", "📘", "📙", "📕", "📒"].cycled().makeIterator()
        var indexIterator = (1...100).makeIterator()

        print("📚 Fetching bunch of books ")

        for try await book in books {
            let emoji = emojisIterator.next()!
            guard let i = indexIterator.next() else {
                break
            }
            print("          \(book), // \(emoji) Book #\(i)")
        }
    }

}
