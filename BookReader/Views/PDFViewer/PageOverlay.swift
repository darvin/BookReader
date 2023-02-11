//
//  PageOverlay.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import UIKit
import PDFKit

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
    
    func doubleTouched(_ text: String, at: CGRect) {
        if let highlightView = highlight(at: at) {
            highlightView.togglePopupView()
        } else {
            let v = HighlightView(frame: at, text: text)
            highlights[at] = v
            addSubview(v)
        }
    }
    
    func touched(_ text: String, at: CGRect) {
        if let highlightView = highlight(at: at) {
            highlightView.togglePopupView()
        }
    }

}

