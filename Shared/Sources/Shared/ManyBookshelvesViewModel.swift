//
//  ManyBookshelvesViewModel.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import Foundation
import SwiftUI
import TelegramReader
import Books

class ManyBookshelvesViewModel : ObservableObject {
  
    @Published
    var bookshelfs: [Books.Bookshelf] = [
        .local,
        .gutenberg1,
        .gutenberg2,
        .telegram
    ]

    
    private var viewModels: [Books.Bookshelf: any Books.Bookshelfable] = [Books.Bookshelf: any Books.Bookshelfable]()
    
    private func viewModel(bookshelf:Books.Bookshelf) -> any Books.Bookshelfable {
        if !viewModels.keys.contains(bookshelf) {
            switch (bookshelf) {
            case .local:
                viewModels[bookshelf] = Books.LocalBookshelfViewModel()

            case .gutenberg1:
                viewModels[bookshelf] = Books.GutenBookshelfViewModel()
                
            case .gutenberg2:
                viewModels[bookshelf] = Books.GutenBookshelfViewModel()
            case .telegram:
                viewModels[bookshelf] = TelegramReader.TelegramBookshelfViewModel()


                
            default:
                fatalError()
            }
        }
        return viewModels[bookshelf]!

    }

//    @ViewBuilder
    func view(bookshelf:Bookshelf) throws -> some View {
        switch (bookshelf) {

        case .gutenberg1:
            let vm = viewModel(bookshelf: bookshelf) as! Books.GutenBookshelfViewModel
            return AnyView(Books.BookshelfView<Books.GutenBookshelfViewModel>(viewModel:vm))
                        .task {
                            await vm.getFirstHundred()
                        }
        case .gutenberg2:
            let vm = viewModel(bookshelf: bookshelf) as! Books.GutenBookshelfViewModel
            return AnyView(Books.BookshelfView<Books.GutenBookshelfViewModel>(viewModel:vm))
                        .task {
                            await vm.getAnotherHundred()
                        }
        case .local:
            let vm = viewModel(bookshelf: bookshelf) as! Books.LocalBookshelfViewModel
            return AnyView(Books.BookshelfView<Books.LocalBookshelfViewModel>(viewModel:vm))
                .task {
                    await vm.fetch()
                }
        case .telegram:
            let vm = viewModel(bookshelf: bookshelf) as! TelegramReader.TelegramBookshelfViewModel
            return AnyView(TelegramReader.TelegramBookshelfView(viewModel:vm))
                .task {
                    await vm.fetch()
                }


        default:
            fatalError()
        }
    }
}

