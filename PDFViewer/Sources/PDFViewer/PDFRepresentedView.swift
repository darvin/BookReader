//
//  PDFRepresentedView.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import PDFKit
import SwiftUI
import UIKit

public struct PDFKitRepresentedView: UIViewRepresentable {
    public typealias UIViewType = MyPDFView

    let data: Data
    let bookTitle: String
    
    public init(data: Data, bookTitle: String) {
        self.data = data
        self.bookTitle = bookTitle
    }

    public func makeUIView(context _: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {
        let pdfView = MyPDFView(frame: CGRectNull, bookTitle: bookTitle)
        pdfView.document = PDFDocument(data: data)
        return pdfView
    }

    public func updateUIView(
        _ pdfView: UIViewType,
        context _: UIViewRepresentableContext<PDFKitRepresentedView>
    ) {
        pdfView.document = PDFDocument(data: data)

    }

}
