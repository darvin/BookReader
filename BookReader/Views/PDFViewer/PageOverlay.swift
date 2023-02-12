//
//  PageOverlay.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import UIKit
import PDFKit
import Highlightr


@objc class PageOverlay : UIView {
    private static let highlightr = {
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "paraiso-dark")
        return highlightr
    }()

    weak var pdfView: PDFView?
    private var _page: PDFPage?
    weak var page: PDFPage? {
        get { _page }
        set {
            _page = newValue
        }
        
    }

    func makeHighlights() {
        
        guard let text = page?.string as? NSString else { return }
        guard let highlightedText = PageOverlay.highlightr?.highlight(text as String) else { return }
        highlightedText.enumerateAttribute(NSAttributedString.Key.foregroundColor, in: NSRange(location: 0, length: highlightedText.length)) { color, range, stop in
            if range.length > 10 { return }
            guard let color:UIColor = (color as? UIColor)?.withAlphaComponent(0.1) else {return}
            makeHighlight(range: range, color: color)
        }
        
    }
    
    var highlightsViews = [CGRect : HighlightView]()
    
    func removeHighlights() {
        highlightsViews.forEach { (key: CGRect, value: HighlightView) in
            highlightsViews.removeValue(forKey: key)
            value.removeFromSuperview()
        }
    }
    
    func makeHighlight(range:NSRange, color:UIColor, popupView: UIView? = nil) {
        guard let page, let pdfView else { return }
        guard let selection = page.selection(for: range) else { return }
        let pageBounds = selection.bounds(for: page)
        let pageBoundsPdfView = pdfView.convert(pageBounds, from: page)
        let pageOverlayBounds = pdfView.convert(pageBoundsPdfView, to: self)
        
        let v = HighlightView(frame: pageOverlayBounds, color: color, popupView: popupView)
        highlightsViews[pageOverlayBounds] = v
        addSubview(v)

    }
    
    func highlightView(at: CGPoint) -> HighlightView? {
        let atRect = rectForWord(at: at)
        let smallerRect = atRect.inset(by: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        let rectsFiltered = highlightsViews.keys.filter { r in
            r.contains(smallerRect)
        }
        if let rect = rectsFiltered.first {
            return highlightsViews[rect]
        } else {
            return nil
        }
        
    }
    
    func rectForWord(at: CGPoint) -> CGRect {
        guard let page, let pdfView else { return CGRectNull }
        guard let selection = selection(at: at) else { return CGRectNull }
        let pageRect = selection.bounds(for: page)
        let pdfViewRect = pdfView.convert(pageRect, from: page)
        let overlayRect = pdfView.convert(pdfViewRect, to: self)
        return overlayRect
        
    }
    
    func selection(at: CGPoint) -> PDFSelection? {
        guard let page, let pdfView else { return nil }
        let pdfViewPoint = pdfView.convert(at, from: self)
        let pagePoint = pdfView.convert(pdfViewPoint, to: page)
        let selection = page.selectionForWord(at: pagePoint)
        return selection
    }
    
    func doubleTouched(at: CGPoint) {
        if let highlightView = highlightView(at: at) {
            highlightView.togglePopupView()
        } else {
            let atRect = rectForWord(at:at)
            let v = HighlightView(frame: atRect, popupView:  PopupView(frame: CGRect(origin: CGPointZero, size: atRect.size), text: selection(at:at)?.string ?? "-----") )
            highlightsViews[atRect] = v
            addSubview(v)
        }
    }
    
    func touched(at: CGPoint) {
        if let highlightView = highlightView(at: at) {
            highlightView.togglePopupView()
        }
    }

}

