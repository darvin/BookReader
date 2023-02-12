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


@objc class PDFViewHandler : NSObject, PDFPageOverlayViewProvider, PDFViewDelegate {

    private var _pdfView: PDFView?
    
    private var pageOverlays = [PDFPage: PageOverlay]()
    
    var pdfView: PDFView {
        set {
            _pdfView = newValue
            _pdfView?.pageOverlayViewProvider = self
            _pdfView?.addGestureRecognizer(tapGestureRecognizer)
            _pdfView?.addGestureRecognizer(doubleTapGestureRecognizer)
            _pdfView?.delegate = self

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
            pageOverlays[page] = pageOverlay

            pageOverlay.pdfView = pdfView
            pageOverlay.page = page
        }
        return pageOverlays(page: page)
    }
    
    func pdfView(
        _ pdfView: PDFView,
        willDisplayOverlayView overlayView: UIView,
        for page: PDFPage
    ) {
        if let pageOverlay = overlayView as? PageOverlay {
            pageOverlay.makeHighlights()
        }
    }
    
    func pdfView(_ pdfView: PDFView, willEndDisplayingOverlayView overlayView: UIView, for page: PDFPage) {
        if let pageOverlay = overlayView as? PageOverlay {
            pageOverlay.removeHighlights()
        }
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
    
    @objc func doubleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let page = pdfView.page(for: gestureRecognizer.location(in: pdfView), nearest: true) else { return }
        let pageOverlay = pageOverlays(page: page)
        let pdfViewPoint = gestureRecognizer.location(in: pdfView)
        let pageOverlayPoint = pdfView.convert(pdfViewPoint, to:pageOverlay)
        pageOverlay.doubleTouched(at:pageOverlayPoint)
    }
    
    @objc func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        print("tap")

        guard let page = pdfView.page(for: gestureRecognizer.location(in: pdfView), nearest: true) else { return }
        let pageOverlay = pageOverlays(page: page)
        let pdfViewPoint = gestureRecognizer.location(in: pdfView)
        let pageOverlayPoint = pdfView.convert(pdfViewPoint, to:pageOverlay)

        pageOverlay.touched(at:pageOverlayPoint)
    }

}

