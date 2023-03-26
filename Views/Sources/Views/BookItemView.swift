//
//  File.swift
//
//
//  Created by standard on 2/23/23.
//

import Protocols
import SwiftUI

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
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.top, 3)
        .padding(.bottom, 3)
        .padding(.leading, 9)
    }
}
