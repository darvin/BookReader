//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import SwiftUI
import Protocols

public struct BookThumbnailURLView: View {
    let imageWidth: CGFloat = 150

    var book: BookThumbnailURL
    public var body: some View {
        AsyncImage(url: book.thumbnailURL) { image in
            image
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
        } placeholder: {
            ProgressView()
                .frame(width: imageWidth)
        }

    }
}
