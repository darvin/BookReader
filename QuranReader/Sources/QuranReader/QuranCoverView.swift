//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation
import SwiftUI
import UITools
import CrookedText

let BookCoverWidth: CGFloat = 150


extension String {

    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }

    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
        
    func splitToLines(usingFont font: UIFont, forWidth width: CGFloat) -> [String] {
        let inputTextWords = self.components(separatedBy: " ")
        var resultArray:[String] = []
        var readerString = ""
        for i in 0 ..< inputTextWords.count {
            let word = inputTextWords[i]
            let readerStringWithNewWord = readerString.appending("\(word) ")
            let currentWidth = readerStringWithNewWord.widthOfString(usingFont:font)
            if currentWidth >= width {
                resultArray.append(readerString)
                readerString = word
            } else {
                readerString = readerStringWithNewWord
            }
         }
        resultArray.append(readerString)
        return resultArray

    }
        
}


struct CurvedMultilineTextInner: View {
    var lines: [String]
    
    var body: some View {
        VStack {
            ForEach(lines, id: \.self) { line in
                
                ZStack {
                    Text(line).opacity(0)

                    let radius:CGFloat = 200

                    CrookedText(text: line, radius: radius)
                        .offset(x:0,y:radius)
                        .frame(width: 0, height: 0).opacity(0.9)
                }
            }
        }

    }
}



struct CurvedMultilineText: View {
    var text: String
    @Environment(\.font) var font

    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {

        let uiFont = UIFont.systemFont(ofSize: 8.0)
        GeometryReader { gp in
            let lines = text.splitToLines(usingFont: uiFont, forWidth: gp.size.width)

            CurvedMultilineTextInner(lines: lines).font(Font(uiFont))

        }

    }

    

}


public struct QuranCoverView: View {
    @Environment(\.presentationMode) var presentationMode

    @StateObject
    var viewModel: QuranCoverViewModel

    init(viewModel: QuranCoverViewModel) {
        _viewModel = StateObject(wrappedValue:viewModel)
    }
    public init(book: QuranBook) {
        self.init(viewModel:QuranCoverViewModel(book: book))
    }
    public var body: some View {
        let uiFont = UIFont.systemFont(ofSize: 8.0)
        let lineOffset = "X".heightOfString(usingFont: uiFont)
        let padding: CGFloat = 1.0
        let paddingInner: CGFloat = 2.0
        if viewModel.isReady {
            GeometryReader { r in
                HStack {
                    
                    

                    ZStack {
                        CurvedMultilineText("\(viewModel.translation ?? "" )")

                        CurvedMultilineText("\(viewModel.translationTranslit ?? "" )")
                            .offset(y:lineOffset)

                    }
                    .frame(maxWidth: .infinity)
                    .padding(paddingInner)
                    Divider()

                    ZStack {
//                        Text("\(viewModel.arabic ?? "" )")

                        CurvedMultilineText("\(viewModel.arabic ?? "" )")

                        CurvedMultilineText("\(viewModel.arabicTranslit ?? "" )")
                            .offset(y:lineOffset)

                    }
                    .frame(maxWidth: .infinity)
                    .padding(paddingInner)

                    

                    
                }
                .padding(padding)
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




struct QuranCoverView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuranCoverView(viewModel: QuranCoverViewModel.previewViewModels[0])
            QuranCoverView(viewModel: QuranCoverViewModel.previewViewModels[1])
            QuranCoverView(viewModel: QuranCoverViewModel.previewViewModels[2])
            QuranCoverView(viewModel: QuranCoverViewModel.previewViewModels[3])
            QuranCoverView(viewModel: QuranCoverViewModel.previewViewModels[4])
        }
        .previewLayout(.fixed(width: 150, height: 120))
    }
}
