//
//  PDFRepresentedView.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import PDFKit
import SwiftUI
import UIKit

struct PDFKitRepresentedView: UIViewRepresentable {
    typealias UIViewType = MyPDFView

    let data: Data
    let book: any BookMetadatable

    func makeUIView(context _: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {
        let pdfView = MyPDFView(frame: CGRectNull, book: book)
        pdfView.document = PDFDocument(data: data)
        return pdfView
    }

    func updateUIView(
        _ pdfView: UIViewType,
        context _: UIViewRepresentableContext<PDFKitRepresentedView>
    ) {
        pdfView.document = PDFDocument(data: data)

    }

}
