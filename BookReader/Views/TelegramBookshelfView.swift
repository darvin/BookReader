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
        VStack {
            BookshelfView(viewModel: viewModel)
        }
    }
}

