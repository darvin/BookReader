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


@objc class PDFViewHandler : NSObject, PDFPageOverlayViewProvider {

    private var _pdfView: PDFView?
    
    private var pageOverlays = [PDFPage: PageOverlay]()
    
    var pdfView: PDFView {
        set {
            _pdfView = newValue
            _pdfView?.pageOverlayViewProvider = self
            _pdfView?.addGestureRecognizer(tapGestureRecognizer)
            _pdfView?.addGestureRecognizer(doubleTapGestureRecognizer)

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
    
    
    lazy var doubleTapGestureRecognizer: UITapGestureRecognizer = {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        return doubleTapGesture
    }()
    
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.require(toFail: doubleTapGestureRecognizer)
        return tapGesture
    }()
    
    func selectedPageOverlayWordAndBounds(for gestureRecognizer: UITapGestureRecognizer) -> (PageOverlay, String, CGRect)? {
        let point = gestureRecognizer.location(in: pdfView)
        
        guard let page = pdfView.page(for: point, nearest: true) else { return nil }
        let pageOverlay = pageOverlays(page: page)

        let convertedPoint = pdfView.convert(point, to: page)

        guard page.annotation(at: convertedPoint) == nil else { return nil }
        guard let selection = page.selectionForWord(at: convertedPoint) else { return nil }

        guard let wordTouched = selection.string else { return nil }
        let pageBounds = selection.bounds(for: page)
        let pageBoundsPdfView = pdfView.convert(pageBounds, from: page)
        let pageOverlayBounds = pdfView.convert(pageBoundsPdfView, to: pageOverlay)

        return (pageOverlay, wordTouched, pageOverlayBounds)
    }
    
    @objc func doubleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        if let (pageOverlay, wordTouched, pageOverlayBounds) = selectedPageOverlayWordAndBounds(for: gestureRecognizer) {
            pageOverlay.doubleTouched(wordTouched, at:pageOverlayBounds)
        }
    }
    
    @objc func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        if let (pageOverlay, wordTouched, pageOverlayBounds) = selectedPageOverlayWordAndBounds(for: gestureRecognizer) {
            pageOverlay.touched(wordTouched, at:pageOverlayBounds)
        }
        
    }

}

