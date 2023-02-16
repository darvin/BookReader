//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import SwiftUI

public protocol BookCover {
    associatedtype BookCoverView : View

    var viewBookCover: BookCoverView { get }

}


public protocol BookThumbnailURL {
    var thumbnailURL: URL { get }
}
