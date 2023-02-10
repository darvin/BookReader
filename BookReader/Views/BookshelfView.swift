//
//  BookshelfView.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI


struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct BookshelfView<Book: BookMetadatable, BookshelfViewModel: Bookshelfable>: View {
    @ObservedObject
    var viewModel: BookshelfViewModel
    var body: some View {
        GeometryReader { geometryProxy in
            
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.books, id: \.self) { book in
                        NavigationLink {
                            NavigationLazyView<OpenPDFBookView>(
                                OpenPDFBookView(book: book as! (any BookPDFable))

                            
                            )
                        } label: {
                            BookView(book: book)
                                .frame(width: geometryProxy.size.width, height: 100)
                        }

                        
                    }
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
