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
    typealias UIViewType = PDFView

    let data: Data
    let singlePage: Bool
    let pdfViewHandler = PDFViewHandler()

    init(_ data: Data, singlePage: Bool = false) {
        self.data = data
        self.singlePage = singlePage
    }
    
    func makeUIView(context _: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {

        
        let pdfView = PDFView()
        pdfViewHandler.pdfView = pdfView

        pdfView.document = PDFDocument(data: data)
        pdfView.autoScales = true
        pdfView.pageShadowsEnabled = false

        #if true
            pdfView.backgroundColor = UIColor.red
            pdfView.pageBreakMargins = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
        #else
            pdfView.pageBreakMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        #endif
        if singlePage {
            pdfView.displayMode = .singlePage
        }
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
