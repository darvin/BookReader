//
//  BookMetadatable.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation

public protocol BookMetadatable: Hashable, Equatable, Identifiable {

    var title: String { get }
    var author: String { get }
    var thumbnailURL: URL { get }
}

public protocol BookPDFable: BookMetadatable {
    var pdfURL: URL? { get }
}
