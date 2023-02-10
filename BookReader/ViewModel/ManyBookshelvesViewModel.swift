//
//  ManyBookshelvesViewModel.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import Foundation
import SwiftUI
class ManyBookshelvesViewModel : ObservableObject {
    
//    let bookshelfs = [
//        Bookshelf(id: 0, name: "Gutenberg 1"): BookshelfView<GutenBook, GutenBookshelfViewModel>(viewModel: viewModel)
//            .task {
//                await viewModel.getFirstHundred()
//            },
//        Bookshelf(id: 1, name: "Gutenberg 2"): BookshelfView<GutenBook, GutenBookshelfViewModel>(viewModel: viewModel)
//            .task {
//                await viewModel.getAnotherHundred()
//            }
//
//    ]
  
    @Published
    var bookshelfs: [Bookshelf] = [
        Bookshelf(id: 0, name: "Gutenberg 1"),
        Bookshelf(id: 1, name: "Gutenberg 2")
    ]

    
    private var viewModels: [Bookshelf: any Bookshelfable] = [Bookshelf: any Bookshelfable]()
    
    private func viewModel(bookshelf:Bookshelf) -> any Bookshelfable {
        if !viewModels.keys.contains(bookshelf) {
            switch (bookshelf) {
            case bookshelfs[0]:
                viewModels[bookshelf] = GutenBookshelfViewModel()
                
            case bookshelfs[1]:
                viewModels[bookshelf] = GutenBookshelfViewModel()
                

                
            default:
                fatalError()
            }
        }
        return viewModels[bookshelf]!

    }

    
    func view(bookshelf:Bookshelf) throws -> some View {
        switch (bookshelf) {
        case bookshelfs[0]:
            let vm = viewModel(bookshelf: bookshelf) as! GutenBookshelfViewModel
            return BookshelfView<GutenBookshelfViewModel>(viewModel:vm)
                        .task {
                            await vm.getFirstHundred()
                        }
        case bookshelfs[1]:
            let vm = viewModel(bookshelf: bookshelf) as! GutenBookshelfViewModel
            return BookshelfView<GutenBookshelfViewModel>(viewModel:vm)
                        .task {
                            await vm.getAnotherHundred()
                        }

        default:
            fatalError()
        }
    }
}

