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

    let pdfView: PDFView
    let pdfViewHandler = PDFViewHandler()

    func makeUIView(context _: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {

        return pdfView
    }

    func updateUIView(_ pdfView: UIViewType, context _: UIViewRepresentableContext<PDFKitRepresentedView>) {
 
    }
    
    
}

#elseif os(macOS)
struct PDFKitRepresentedView: View {
    
}
#else

#endif
