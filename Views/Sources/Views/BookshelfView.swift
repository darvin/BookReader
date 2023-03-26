//
//  File.swift
//
//
//  Created by standard on 2/23/23.
//

import Protocols
import SwiftUI

struct BookshelfView<Book: BookMetadatable & BookOpenable & BookCover>: View {
    let books: [Book]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void

    @State
    var isGridLayout = true

    var body: some View {
        GeometryReader { r in

            ScrollView(.vertical) {
                if isGridLayout {
                    let columnWidth: CGFloat = 100
                    let columnSpacing: CGFloat = 30
                    let columnCount: Int = .init(floor(r.size.width / (columnWidth + columnSpacing)))

                    let columns = Array(
                        repeating:
                        GridItem(.fixed(columnWidth), spacing: columnSpacing),
                        count: columnCount
                    )

                    LazyVGrid(columns: columns) {
                        ForEach(books, id: \.self) { book in
                            BookItemView(book: book)
                                .frame(
                                    width: columnWidth,
                                    height: 150
                                )
//                                .background(Color(uiColor:UIColor.systemGray3))
                                .padding(.top, 3)
                                .padding(.bottom, 3)
                                .padding(.trailing, 6)
                                .padding(.leading, 3)
                                .onAppear {
                                    if self.books.last == book {
                                        self.onScrolledAtBottom()
                                    }
                                }
                        }
                    }
                } else {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(books, id: \.self) { book in
                            BookItemView(book: book)
                                .frame(height: 150)
                                .onAppear {
                                    if self.books.last == book {
                                        self.onScrolledAtBottom()
                                    }
                                }
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

    private var loadingIndicator: some View {
        Spinner(style: .medium)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}
