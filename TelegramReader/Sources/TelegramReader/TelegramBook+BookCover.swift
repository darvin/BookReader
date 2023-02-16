//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import UITools
import Protocols

extension TelegramBook: BookCover {
    
}
extension TelegramBook: BookThumbnailURLCover {
    public var viewBookCover: BookThumbnailURLView {
        viewThumbnailURLCover
    }
}
