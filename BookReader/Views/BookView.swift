//
//  BookView.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI

struct BookView<Book: BookMetadatable>: View {
    var book: Book
    
    var body: some View {
        HStack {
            AsyncImage(url: book.thumbnailURL)
                .frame(width: 200, height: 200)

            VStack {
                Text("\(book.title)")
                    .lineLimit(2)
                
                Text("\(book.author)")
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            BookView(book: GutenFetcher.dummyBooks[2])
            BookView(book: GutenFetcher.dummyBooks[3])
            BookView(book: GutenFetcher.dummyBooks[33])
        }
    }
}
