//
//  BookshelfView.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI
import Protocols

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct BookItemView<Book: BookMetadatable & BookOpenable & BookCover>: View {

    let book: Book

    var body: some View {
        NavigationLink {
            NavigationLazyView<VStack>(
                VStack {
                    book.view
                }
            )
        } label: {
            BookView(book: book)
        }.buttonStyle(PlainButtonStyle())

    }

}

public struct BookshelfView<BookshelfViewModel>: View where BookshelfViewModel: Bookshelfable {
    @ObservedObject
    var viewModel: BookshelfViewModel

    @State
    var isGridLayout = true
    
    public init(viewModel: any Bookshelfable, isGridLayout: Bool = true) {
        self.viewModel = viewModel as! BookshelfViewModel
        self.isGridLayout = isGridLayout
    }

    public var body: some View {

        GeometryReader { r in

            ScrollView(.vertical) {
                if isGridLayout {
                    let columnWidth: CGFloat = 100
                    let columnSpacing: CGFloat = 10
                    let columnCount: Int = Int(floor(r.size.width / (columnWidth + columnSpacing)))

                    let columns = Array(
                        repeating:
                            GridItem(.fixed(columnWidth), spacing: columnSpacing),
                        count: columnCount
                    )

                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.books, id: \.self) { book in
                            BookItemView(book: book)
                                .frame(
                                    width: columnWidth,
                                    height: 150
                                )

                        }

                    }

                }
                else {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(viewModel.books, id: \.self) { book in
                            BookItemView(book: book)
                                .frame(height: 150)

                        }
                    }
                }

            }
            .toolbar {
                Button(action: {
                    isGridLayout = true
                }) {
                    Image(systemName: "rectangle.grid.3x2")
                        .font(Font.system(.footnote, weight: isGridLayout ? .bold : .regular))

                }
                Button(action: {
                    isGridLayout = false

                }) {
                    Image(systemName: "rectangle.grid.1x2")
                        .font(Font.system(.footnote, weight: !isGridLayout ? .bold : .regular))

                }

            }

        }
    }
}

//struct BookshelfView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookshelfView<GutenPreviewViewModel>(viewModel: GutenPreviewViewModel())
//    }
//}
