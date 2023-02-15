//
//  BookView.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI
import Models

let ImageWidth: CGFloat = 150

struct BookView<Book: BookMetadatable>: View {
    var book: Book

    var body: some View {
        HStack {
            AsyncImage(url: book.thumbnailURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ImageWidth)
            } placeholder: {
                ProgressView()
                    .frame(width: ImageWidth)
            }

            VStack(alignment: .leading) {
                Text("\(book.title)")
                    .lineLimit(2)

                Text("\(book.author)")
                    .font(Font.system(size: 10).italic())
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

//struct BookView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//
//            BookView(book: GutenFetcher.dummyBooks[2])
//            BookView(book: GutenFetcher.dummyBooks[3])
//            BookView(book: GutenFetcher.dummyBooks[33])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
