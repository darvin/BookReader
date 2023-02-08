//
//  BookMetadatable.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation


protocol BookMetadatable: Hashable, Equatable {
    var title: String { get }
    var author: String { get }
    var thumbnailURL: URL { get }
}
