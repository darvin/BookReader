//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import PDFViewer


extension LocalBook: BookPDFOpenable {
    public var view: PDFViewer.PDFBookView {
        PDFBookView(book: self)
    }
    
    
  
}
