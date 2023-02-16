//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import Protocols

public protocol BookPDFOpenable: BookOpenable, BookPDFable where Body == PDFBookView {
    var pdfURL: URL? { get }
}

public extension BookPDFOpenable {
    
    var body:  PDFBookView  {
        PDFBookView(book: self)
    }
}
