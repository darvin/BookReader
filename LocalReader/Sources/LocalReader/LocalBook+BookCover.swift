//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation
import Protocols
import UITools

extension LocalBook: BookCover {
    
}
extension LocalBook: BookThumbnailURLCover {
    public var viewBookCover: BookThumbnailURLView {
        viewThumbnailURLCover
    }
}
