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


public struct VerseView: View {
    
    @ObservedObject
    var viewModel: VerseViewModel
    
    
    public var body: some View {
        VStack {
            Text("(\(viewModel.chapter.arabicNumber()):\(viewModel.verse.arabicNumber()))")
            if let arabic = viewModel.arabic {
                Text(arabic)
            }
            if let arabicTranslit = viewModel.arabicTranslit {
                Text(arabicTranslit)
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

