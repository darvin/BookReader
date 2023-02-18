//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import SwiftUI


public struct QuranView: View {
//    @Environment(\.presentationMode) var presentationMode
//
    @StateObject
    var viewModel: QuranViewModel

    @State private var opacity = 1.0

    
    init(viewModel: QuranViewModel) {
        _viewModel = StateObject(wrappedValue:viewModel)
    }
    public init(book: QuranBook) {
        self.init(viewModel:QuranViewModel(book: book))
    }

    
    public var body: some View {
        
        if viewModel.isReady {
                VerseView(viewModel: viewModel.verseViewModel!)
                .opacity(opacity)
                .onTapGesture {
                    viewModel.verseIndex += 1
                }
                .onReceive(viewModel.$verseViewModel) { _ in
                    opacity = 0.1
                    withAnimation(.easeInOut(duration: 1.0)) {
                        opacity = 1.0
                    }
                    viewModel.playRecitation()

                }
        } else {
            ProgressView().task {
                await viewModel.load()
            }
        }

    }
}
