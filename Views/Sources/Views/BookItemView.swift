//
//  File.swift
//  
//
//  Created by standard on 2/23/23.
//

import SwiftUI
import Protocols


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
