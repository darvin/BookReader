//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation
import SwiftUI

extension Int {
    func arabicNumber() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "ar")
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}


let QuranFontName = "Amiri Quran Colored"

public struct VerseView: View {
    
    @ObservedObject
    var viewModel: VerseViewModel
    
    
    public var body: some View {
        let verseColorCurrentWord = Color(UIColor.label)
        let verseColor = Color(UIColor.lightText)
        VStack {

            Text("(\(viewModel.chapter.arabicNumber()):\(viewModel.verse.arabicNumber()))")
            if let arabic = viewModel.arabic {
                let textViews = arabic.components(separatedBy: " ").enumerated().map { (i, word) -> Text in
                    
                    let isCurrentWord: Bool = (i == viewModel.playingNowWordIndex)
                    
                    return Text(word)
                        .foregroundColor(isCurrentWord ? verseColorCurrentWord : verseColor)
                        .font(Font.custom(QuranFontName, size: 600, relativeTo: .body))
                }
                    
                textViews.reduce(Text(""), { $0 + $1 +
                    Text(" ")
                        .font(Font.custom(QuranFontName, size: 600, relativeTo: .body))
                    
                } )
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)


            }
            if let arabicTranslit = viewModel.arabicTranslit {
//                Text(arabicTranslit)
                let reversedTranslit = String(arabicTranslit.reversed())
                let reversedTranslitWords = reversedTranslit.components(separatedBy: " ")
                let textViews = reversedTranslitWords.enumerated().map { (i, word) -> Text in
                    
                    let isCurrentWord: Bool = (reversedTranslitWords.count - 1 - i == viewModel.playingNowWordIndex)
                    
                    return Text(word)
                        .font(Font.custom(QuranFontName, size: 200, relativeTo: .body).smallCaps())
                        .foregroundColor(isCurrentWord ? verseColorCurrentWord : verseColor)
                }
                    
                textViews.reduce(Text(""), { $0 + $1 +
                    Text(" ")
                        .font(Font.custom(QuranFontName, size: 200, relativeTo: .body))
                } )
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)

            }
            if let translation = viewModel.translation {
                Text(translation)
            }
            if let translationTranslit = viewModel.translationTranslit {
                Text(translationTranslit)
            }
            Text("(\(viewModel.chapter):\(viewModel.verse))")

        }
    }
}

