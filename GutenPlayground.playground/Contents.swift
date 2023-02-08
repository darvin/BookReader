import PlaygroundSupport


let g = GutenFetcher()

let books = g.fetchBooks()

for try await book in books {
    print(book)
}

