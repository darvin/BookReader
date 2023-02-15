//
//  TelegramBookshelfView.swift
//  BookReader
//
//  Created by standard on 2/15/23.
//

import SwiftUI
import Books

public struct TelegramBookshelfView: View {
    @ObservedObject
    var viewModel: TelegramBookshelfViewModel
    public init(viewModel: TelegramBookshelfViewModel) {
        self.viewModel = viewModel
    }
    public var body: some View {
        if !viewModel.showingLoginScreen {
            VStack {
                Books.BookshelfView<TelegramBookshelfViewModel>(viewModel: viewModel)
            }

        } else {
            LoginView(onClose: { viewModel.showingLoginScreen = false })

        }
        
        
    }
}
