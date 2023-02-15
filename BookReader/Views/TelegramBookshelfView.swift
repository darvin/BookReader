//
//  TelegramBookshelfView.swift
//  BookReader
//
//  Created by standard on 2/15/23.
//

import SwiftUI

struct TelegramBookshelfView: View {
    @ObservedObject
    var viewModel: TelegramBookshelfViewModel
    var body: some View {
        if !viewModel.showingLoginScreen {
            VStack {
                BookshelfView(viewModel: viewModel)
            }

        } else {
            LoginView(onClose: { viewModel.showingLoginScreen = false })

        }
        
        
    }
}

