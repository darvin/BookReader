//
//  MainView.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI



struct MainView: View {
    @StateObject
    var viewModel = ManyBookshelvesViewModel()
    

    var body: some View {
        NavigationView {
            List(viewModel.bookshelfs) { bookshelf in
                NavigationLink {
                    try? viewModel.view(bookshelf:bookshelf)
                } label: {
                    BookshelfRow(bookshelf: bookshelf)
                }
            }
            .navigationTitle("Bookshelfs")


            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
