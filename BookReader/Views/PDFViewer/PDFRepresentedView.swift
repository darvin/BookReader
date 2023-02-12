//
//  PDFRepresentedView.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import SwiftUI
import UIKit
import PDFKit

#if os(iOS) || os(watchOS) || os(tvOS)

struct PDFKitRepresentedView: UIViewRepresentable {
    typealias UIViewType = MyPDFView
    
    let data: Data

    func makeUIView(context _: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {
        let pdfView = MyPDFView()
        pdfView.document = PDFDocument(data: data)
        return pdfView
    }

    func updateUIView(_ pdfView: UIViewType, context _: UIViewRepresentableContext<PDFKitRepresentedView>) {
        pdfView.document = PDFDocument(data: data)

    }
    
    
    
    
}

#elseif os(macOS)
struct PDFKitRepresentedView: View {
    
}
#else

#endif
