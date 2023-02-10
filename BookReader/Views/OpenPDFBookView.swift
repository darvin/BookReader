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

@objc class PopupView : UIView {
    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        let labelOffsetY = -frame.size.height - 2.0
        let l = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: labelOffsetY), size: frame.size))
        l.text = text.translate()
        l.textAlignment = .center
//        layer.backgroundColor = CGColor(red: 0.3, green: 0.2, blue: 0.2, alpha: 0.8)
        l.textColor = UIColor.brown
        l.adjustsFontSizeToFitWidth = true
        l.backgroundColor = UIColor.gray
        addSubview(l)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc class HighlightView : UIView {
    
    private var popupView: UIView
    
    init(frame: CGRect, text: String) {
        popupView = PopupView(frame: CGRect(origin: CGPointZero, size: frame.size), text: text)
        
        super.init(frame: frame)
        layer.backgroundColor = CGColor(red: 0, green: 0.3, blue: 0.1, alpha: 0.4)
        addSubview(popupView)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func togglePopupView() {
        popupView.isUserInteractionEnabled = !popupView.isUserInteractionEnabled
        popupView.isHidden = !popupView.isHidden

    }

}

public protocol HashableSynthesizable: Hashable { }

public extension HashableSynthesizable {
  static func == (hashable0: Self, hashable1: Self) -> Bool {
    zip(hashable0.hashables, hashable1.hashables).allSatisfy(==)
  }

  func hash(into hasher: inout Hasher) {
    hashables.forEach { hasher.combine($0) }
  }
}

private extension HashableSynthesizable {
  var hashables: [AnyHashable] {
    Mirror(reflecting: self).children
      .compactMap { $0.value as? AnyHashable }
  }
}

extension CGPoint: HashableSynthesizable { }
extension CGRect: HashableSynthesizable { }


@objc class PageOverlay : UIView {
    
    weak var pdfView: PDFView?
    weak var pdfPage: PDFPage?

    
    var highlights = [CGRect : HighlightView]()
    
    func highlight(at: CGRect) -> HighlightView? {
        let smallerRect = at.inset(by: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        let rectsFiltered = highlights.keys.filter { r in
            r.contains(smallerRect)
        }
        if let rect = rectsFiltered.first {
            return highlights[rect]
        } else {
            return nil
        }
        
    }
    
    func touched(_ text: String, at: CGRect) {
        if let highlightView = highlight(at: at) {
            highlightView.togglePopupView()
        } else {
            let v = HighlightView(frame: at, text: text)
            highlights[at] = v
            addSubview(v)
        }
        


    }
}


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


struct OpenPDFBookView_Previews: PreviewProvider {
    static var previews: some View {
        OpenPDFBookView(book: GutenFetcher.dummyBooks[33])
    }
}
