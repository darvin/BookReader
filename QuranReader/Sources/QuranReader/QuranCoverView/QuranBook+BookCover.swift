//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation
import Protocols
protocol QuranCover: BookCover where BookCoverView == QuranCoverView {
    
}



extension QuranBook: QuranCover {
    public var viewBookCover: QuranCoverView {
        QuranCoverView(book: self as QuranBook)
    }
}
