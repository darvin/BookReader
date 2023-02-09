//
//  OpenPDFBookView.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import SwiftUI
import PDFKit


struct OpenPDFBookView: View {
    @ObservedObject
    var viewModel: OpenBookViewModel

    var body: some View {
        
        if let data = viewModel.pdfData {
            PDFKitRepresentedView(data)
        } else {
            ProgressView().task {
                await viewModel.load()
            }
        }
        
    }
}



#if os(iOS) || os(watchOS) || os(tvOS)

struct PDFKitRepresentedView: UIViewRepresentable {
    typealias UIViewType = PDFView

    let data: Data
    let singlePage: Bool

    init(_ data: Data, singlePage: Bool = false) {
        self.data = data
        self.singlePage = singlePage
    }

    func makeUIView(context _: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {
        // Create a `PDFView` and set its `PDFDocument`.
        let pdfView = PDFView()
        pdfView.document = PDFDocument(data: data)
        pdfView.autoScales = true
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


struct OpenPDFBookView_Previews: PreviewProvider {
    static var previews: some View {
        OpenPDFBookView(viewModel: OpenBookViewModel(book: GutenFetcher.dummyBooks[33]))
    }
}
