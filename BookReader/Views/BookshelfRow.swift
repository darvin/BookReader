//
//  BookshelfRow.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import SwiftUI

struct BookshelfRow: View {
    var bookshelf: Bookshelf
    var body: some View {
        Text("📚\(bookshelf.name)")
    }
}

struct BookshelfRow_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfRow(bookshelf: Bookshelf(id: 0, name: "Sample Bookshelf"))
    }
}
