//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import Protocols


protocol QuranOpenable: BookOpenable where BookOpenableView == QuranView {
    
}



extension QuranBook: QuranOpenable {
    
    public var view: QuranView {
        QuranView(book: self as QuranBook)
    }
}
