//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation
import SwiftUI
import UITools

public struct QuranCoverView: View {
    @Environment(\.presentationMode) var presentationMode

    @StateObject
    var viewModel: QuranCoverViewModel

    public init(book: QuranBook) {
        _viewModel = StateObject(wrappedValue: QuranCoverViewModel(book: book))
    }
    public var body: some View {
        let fontSize: CGFloat = 8.0
        if viewModel.isReady {
            GeometryReader { r in
                VStack {
                    
                    VStack {
                        Text("\(viewModel.arabic ?? "" )")
                            .font(Font.system(size: fontSize))
                        Text("\(viewModel.arabicTranslit ?? "" )")
                            .font(Font.system(size: fontSize))
                        
                    }
                    Divider()

                    VStack {
                        Text("\(viewModel.translation ?? "" )")
                            .font(Font.system(size: fontSize))

                        Text("\(viewModel.translationTranslit ?? "" )")
                            .font(Font.system(size: fontSize))
                    }

                    

                    
                }
                .background(Color(viewModel.color))
                .frame(width: BookCoverWidth, height: r.size.height)


            }

        } else {
            ProgressView()
                .frame(width: BookCoverWidth)
                .task {
                await viewModel.load()
            }
        }

    }
}
