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
import Protocols
import ViewModels
import Views
import GutenReader
import LocalReader
import QuranReader

#if !targetEnvironment(macCatalyst)
let platformSpecficBookshelfes =       [
    Bookshelf.telegram
    ]
#else
let platformSpecficBookshelfes: [Bookshelf] =   []

#endif


extension Bookshelf {
    static let local = Bookshelf(id: 0, name: "Local")
    static let gutenberg1 = Bookshelf(id: 1, name: "Gutenberg 1")
    static let gutenberg2 = Bookshelf(id: 2, name: "Gutenberg 2")
    static let telegram = Bookshelf(id: 3, name: "Telegram")
    static let quran = Bookshelf(id: 4, name: "Quran")

    
}

class ManyBookshelvesViewModel : ObservableObject {
  
    @Published
    var bookshelfs: [Bookshelf] = [
        .local,
        .gutenberg1,
        .gutenberg2,
        .quran,
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
            case .quran:
                viewModels[bookshelf] = QuranBookshelfViewModel()
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
        case .quran:
            let vm = viewModel(bookshelf: bookshelf) as! QuranBookshelfViewModel
            return AnyView(BookshelfView<QuranBookshelfViewModel>(viewModel:vm))
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

