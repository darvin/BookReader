//
//  ManyBookshelvesViewModel.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import Foundation
import SwiftUI
#if !targetEnvironment(macCatalyst)
import TelegramReader
#endif
import Books
import GutenReader

#if !targetEnvironment(macCatalyst)
let platformSpecficBookshelfes =       [
    Bookshelf.telegram
    ]
#else
let platformSpecficBookshelfes: [Bookshelf] =   []

#endif

class ManyBookshelvesViewModel : ObservableObject {
  
    @Published
    var bookshelfs: [Bookshelf] = [
        .local,
        .gutenberg1,
        .gutenberg2,
        ] + platformSpecficBookshelfes


    
    private var viewModels: [Bookshelf: any Bookshelfable] = [Bookshelf: any Bookshelfable]()
    
    private func viewModel(bookshelf:Bookshelf) -> any Bookshelfable {
        if !viewModels.keys.contains(bookshelf) {
            switch (bookshelf) {
            case .local:
                viewModels[bookshelf] = LocalBookshelfViewModel()

            case .gutenberg1:
                viewModels[bookshelf] = GutenBookshelfViewModel()
                
            case .gutenberg2:
                viewModels[bookshelf] = GutenBookshelfViewModel()
#if !targetEnvironment(macCatalyst)

            case .telegram:
                viewModels[bookshelf] = TelegramReader.TelegramBookshelfViewModel()
#endif

                
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
            let vm = viewModel(bookshelf: bookshelf) as! GutenBookshelfViewModel
            return AnyView(BookshelfView<GutenBookshelfViewModel>(viewModel:vm))
                        .task {
                            await vm.getFirstHundred()
                        }
        case .gutenberg2:
            let vm = viewModel(bookshelf: bookshelf) as! GutenBookshelfViewModel
            return AnyView(BookshelfView<GutenBookshelfViewModel>(viewModel:vm))
                        .task {
                            await vm.getAnotherHundred()
                        }
        case .local:
            let vm = viewModel(bookshelf: bookshelf) as! LocalBookshelfViewModel
            return AnyView(BookshelfView<LocalBookshelfViewModel>(viewModel:vm))
                .task {
                    await vm.fetch()
                }
            
#if !targetEnvironment(macCatalyst)

        case .telegram:
            let vm = viewModel(bookshelf: bookshelf) as! TelegramReader.TelegramBookshelfViewModel
            return AnyView(TelegramReader.TelegramBookshelfView(viewModel:vm))
                .task {
                    await vm.fetch()
                }

#endif
        default:
            fatalError()
        }
    }
}

