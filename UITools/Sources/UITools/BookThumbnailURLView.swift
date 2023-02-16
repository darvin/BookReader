//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import SwiftUI
import Protocols

public let BookCoverWidth: CGFloat = 150

public struct BookThumbnailURLView: View {

    var book: BookThumbnailURL
    public var body: some View {
        AsyncImage(url: book.thumbnailURL) { image in
            image
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: BookCoverWidth)
        } placeholder: {
            ProgressView()
                .frame(width: BookCoverWidth)
        }

    }
}
