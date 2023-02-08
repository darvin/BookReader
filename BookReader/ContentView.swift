//
//  ContentView.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject
    var viewModel = GutenBookshelfViewModel()
    var body: some View {
        BookshelfView<GutenBook, GutenBookshelfViewModel>(viewModel: viewModel)
            .task {
                await viewModel.getFirstHundred()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
