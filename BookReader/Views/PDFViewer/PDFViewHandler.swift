//
//  PDFViewHandler.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import UIKit
import PDFKit
import SwiftUI


extension String {
    func translate() -> String {
        return String(self.reversed())
    }
}

#if os(iOS) || os(watchOS) || os(tvOS)

@objc class PDFViewHandler : NSObject, PDFPageOverlayViewProvider {

    private var _pdfView: PDFView?
    
    private var pageOverlays = [PDFPage: PageOverlay]()
    
    var pdfView: PDFView {
        set {
            _pdfView = newValue
            _pdfView?.pageOverlayViewProvider = self
            _pdfView?.addGestureRecognizer(tapGestureRecognizer)

        }
        get {
            _pdfView!
        }
    }
    
    private func pageOverlays(page: PDFPage) -> PageOverlay {
        return pageOverlays[page]!
    }
    
    func pdfView(_ view: PDFView, overlayViewFor page: PDFPage) -> UIView? {
        if !pageOverlays.keys.contains(page) {
            let pageOverlay = PageOverlay()
            pageOverlay.pdfView = pdfView
            pageOverlay.pdfPage = page
            pageOverlays[page] = pageOverlay
        }
        return pageOverlays(page: page)
    }
    
    func pdfView(
        _ pdfView: PDFView,
        willDisplayOverlayView overlayView: UIView,
        for page: PDFPage
    ) {
//        pdfView.addGestureRecognizer(tapGestureRecognizer)

    }
    
    func pdfView(_ pdfView: PDFView, willEndDisplayingOverlayView overlayView: UIView, for page: PDFPage) {
//        pdfView.removeGestureRecognizer(tapGestureRecognizer)
    }
    
    
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
    }()
    
    
    
    @objc func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        let point = gestureRecognizer.location(in: pdfView)
        
        guard let page = pdfView.page(for: point, nearest: true) else { return }
        let pageOverlay = pageOverlays(page: page)

        let convertedPoint = pdfView.convert(point, to: page)

        guard page.annotation(at: convertedPoint) == nil else { return }
        guard let selection = page.selectionForWord(at: convertedPoint) else { return }

        guard let wordTouched = selection.string else { return }
        let pageBounds = selection.bounds(for: page)
        let pageBoundsPdfView = pdfView.convert(pageBounds, from: page)
        let pageOverlayBounds = pdfView.convert(pageBoundsPdfView, to: pageOverlay)
        
        pageOverlay.touched(wordTouched, at:pageOverlayBounds)
        
        //pronounce word
        //                        let utterance = AVSpeechUtterance(string: wordTouched)
        //                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        //
        //                        let synth = AVSpeechSynthesizer()
        //                        synth.speak(utterance)
        print("📖📖 \(wordTouched) 📖📖")
        //                        let options = TranslatorOptions(sourceLanguage: .english, targetLanguage: .german)
        //                        let englishGermanTranslator = Translator.translator(options: options)

        /*
        //if you also want to show selection of this word for one second
        pdfView.currentSelection = selection
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
        pdfView.clearSelection()
        */
    }

}

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
