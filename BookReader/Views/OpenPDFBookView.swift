//
//  OpenPDFBookView.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import SwiftUI
import PDFKit
import AVFoundation

struct OpenPDFBookView: View {
    @StateObject
    var viewModel: OpenBookViewModel
    
    
    init(book: any BookPDFable) {
        _viewModel = StateObject(wrappedValue: OpenBookViewModel(book: book))
    }

    var body: some View {
        //FIXME causes cycle error, fixme
        if let data = viewModel.pdfData {
            PDFKitRepresentedView(data)
        } else {
            ProgressView().task {
                await viewModel.load()
            }
        }
        
    }
}


@objc class PageOverlay : UIView {
    
    weak var pdfView: PDFView?
    weak var pdfPage: PDFPage?

    func makeCircle(_ point : CGPoint) {
        let v = UIView()
        v.frame = CGRect(origin: point, size: CGSize(width: 20, height: 20))
        v.layer.backgroundColor = UIColor.red.cgColor
        addSubview(v)
    }
    
    func convert(point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x, y: frame.height - point.y)
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
        pdfView.addGestureRecognizer(tapGestureRecognizer)

    }
    
    func pdfView(_ pdfView: PDFView, willEndDisplayingOverlayView overlayView: UIView, for page: PDFPage) {
        pdfView.removeGestureRecognizer(tapGestureRecognizer)
    }
    
    
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
    }()
    
    
    
    @objc func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        let point = gestureRecognizer.location(in: pdfView)
        
        if let page = pdfView.page(for: point, nearest: true) {
            let pageOverlay = pageOverlays(page: page)
            //convert point from pdfView coordinate system to page coordinate system
            let convertedPoint = pdfView.convert(point, to: page)
            pageOverlay.makeCircle(pageOverlay.convert(point: convertedPoint))
            //ensure that there is no link/url at this point
            if page.annotation(at: convertedPoint) == nil {
                //get word at this point
                if let selection = page.selectionForWord(at: convertedPoint) {
                    if let wordTouched = selection.string {
                        //pronounce word
//                        let utterance = AVSpeechUtterance(string: wordTouched)
//                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
//
//                        let synth = AVSpeechSynthesizer()
//                        synth.speak(utterance)
                        print("📖📖 \(wordTouched) 📖📖")
//                        let options = TranslatorOptions(sourceLanguage: .english, targetLanguage: .german)
//                        let englishGermanTranslator = Translator.translator(options: options)

                        //if you also want to show selection of this word for one second
                        pdfView.currentSelection = selection
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                            pdfView.clearSelection()
                        }
                    }
                }
            }
        }
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


struct OpenPDFBookView_Previews: PreviewProvider {
    static var previews: some View {
        OpenPDFBookView(book: GutenFetcher.dummyBooks[33])
    }
}
