//
//  BookshelfView.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI

struct BookshelfView<Book: BookMetadatable, BookshelfViewModel: Bookshelfable>: View {
    @ObservedObject
    var viewModel: BookshelfViewModel
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(viewModel.books, id: \.self) { book in
                    BookView(book: book)
                }
            }
        }
    }
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView<GutenBook, GutenPreviewViewModel>(viewModel: GutenPreviewViewModel())
    }
}
