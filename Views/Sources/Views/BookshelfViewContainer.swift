//
//  BookshelfView.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI
import Protocols


public struct BookshelfViewContainer<BookshelfViewModel>: View where BookshelfViewModel: Bookshelfable {
    @ObservedObject
    var viewModel: BookshelfViewModel

    
    public init(viewModel: any Bookshelfable, isGridLayout: Bool = true) {
        self.viewModel = viewModel as! BookshelfViewModel
    }

    public var body: some View {
        BookshelfView(
            books: viewModel.books,
            isLoading: viewModel.canLoadNextPage,
            onScrolledAtBottom: viewModel.fetchNextPageIfPossible
        )
        .onAppear(perform: viewModel.fetchNextPageIfPossible)

    }
}

//struct BookshelfView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookshelfView<GutenPreviewViewModel>(viewModel: GutenPreviewViewModel())
//    }
//}
