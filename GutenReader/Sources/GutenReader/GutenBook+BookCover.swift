//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation
import UITools
import Protocols

extension GutenBook: BookCover {
    
}
extension GutenBook: BookThumbnailURLCover {
    public var viewBookCover: BookThumbnailURLView {
        viewThumbnailURLCover
    }
}
