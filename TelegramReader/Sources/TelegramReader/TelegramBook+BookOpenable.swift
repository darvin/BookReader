//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import PDFViewer

extension TelegramBook: BookOpenPDFable {
    public var view: PDFViewer.PDFBookView {
        bodyPDFBook
    }
}
