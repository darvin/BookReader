//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import Protocols
import SwiftUI


public protocol BookThumbnailURLCover : BookThumbnailURL {
    
}

public extension BookThumbnailURLCover {
    var viewThumbnailURLCover: BookThumbnailURLView {
        BookThumbnailURLView(book: self)
    }

    
}
