//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import Protocols

public protocol BookOpenPDFable: BookOpenable where Body == PDFBookView {
    var pdfURL: URL? { get }
}


public extension BookPDFable {
    var bodyPDFBook:  PDFBookView {
        PDFBookView(book: self)
    }
}
