//
//  PageOverlay.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import UIKit
import PDFKit
import Highlightr


public extension UIImage {
    func
    imageByMakingWhiteBackgroundTransparent() -> UIImage? {

        let image = UIImage(data: self.jpegData(compressionQuality: 1.0)!)!
        let rawImageRef: CGImage = image.cgImage!

        let colorMasking: [CGFloat] = [222, 255, 222, 255, 222, 255]
        UIGraphicsBeginImageContext(image.size);

        let maskedImageRef = rawImageRef.copy(maskingColorComponents: colorMasking)
        UIGraphicsGetCurrentContext()?.translateBy(x: 0.0,y: image.size.height)
        UIGraphicsGetCurrentContext()?.scaleBy(x: 1.0, y: -1.0)
        UIGraphicsGetCurrentContext()?.draw(maskedImageRef!, in: CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height))
        let result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return result

    }

}


@objc class PageOverlay : UIView {
    
    var book: (any BookMetadatable)?

    weak var pdfView: PDFView?
    private var _page: PDFPage?
    weak var page: PDFPage? {
        get { _page }
        set {
            _page = newValue
        }
        
    }

    private var pdfAnnotationBorder:PDFBorder {
        let border = PDFBorder()
        border.lineWidth = 4.0
        border.style = .solid
        return border
    }
    
    private let scaleFactor:CGFloat = 3

    func makeCodeHighlights() {
        guard let page else { return }
        let pageSize = page.bounds(for: .cropBox).size
        let imageSize = CGSize(width: pageSize.width * scaleFactor, height: pageSize.height * scaleFactor)
        guard let image = page.thumbnail(of: imageSize, for: .cropBox).imageByMakingWhiteBackgroundTransparent() else { return }
        

        guard let cgImage = image.cgImage else { return }

        guard let pageText = page.attributedString  else { return }
        
        guard let colorizedPageText = Highlighter.shared.highlight(pageText.string, inBook:book) else {return}
        
        colorizedPageText
            .removingIgnoredColors()
//            .removingColorsWithLowLineCoverage()
            .removeForegroundColorFromLongLines()
            .enumerateAttribute(.foregroundColor, in: NSRange(0..<colorizedPageText.length), options: .longestEffectiveRangeNotRequired) {
            color, range, stop in
            guard let color = color as? UIColor else { return }
            guard let pageBounds = rectFor(range: range) else { return }
            let text = colorizedPageText.attributedSubstring(from: range)
            let textOrig = pageText.attributedSubstring(from: range)
            assert(text.string == textOrig.string)
            print("\(pageBounds) \(text.string)")
            let imageRect = CGRect(
                x:pageBounds.minX*scaleFactor,
                y:pageBounds.minY*scaleFactor,
                width:pageBounds.width*scaleFactor,
                height:pageBounds.height*scaleFactor
            )
            guard let mask = cgImage.cropping(to: imageRect) else { return }
            makeColorization(range: range, color: color, mask: mask)
        }

    }
    
    
    var highlightsViews = [CGRect : UIView]()

    func removeHighlights() {
        highlightsViews.forEach { (key: CGRect, value: UIView) in
            highlightsViews.removeValue(forKey: key)
            value.removeFromSuperview()
        }
    }
    
    private func convertFromPage(_ rect:CGRect) -> CGRect? {
        guard let page, let pdfView else { return nil }
        let pageBoundsPdfView = pdfView.convert(rect, from: page)
        let pageOverlayBounds = pdfView.convert(pageBoundsPdfView, to: self)
        return pageOverlayBounds
    }
    
    private func makeCodeHighlight(pageBounds:CGRect, code:String) {
        guard let rect = convertFromPage(pageBounds) else { return }
        let v = CodeOverlayView(frame: rect, code: code)
        highlightsViews[rect] = v
        addSubview(v)
    }

    

    
    func makeColorization(pageBounds:CGRect, color:UIColor, mask: CGImage) {
        guard let rect = convertFromPage(pageBounds) else { return }
        let v = FontColorizationOverlayView(frame:rect, mask: mask, color:color)
        highlightsViews[rect] = v
        addSubview(v)
    }
    
    
    func makeHighlight(pageBounds:CGRect, color:UIColor, popupView: UIView? = nil) {
        guard let rect = convertFromPage(pageBounds) else { return }
        let v = HighlightView(frame: rect, color: color, popupView: popupView)
        highlightsViews[rect] = v
        addSubview(v)
    }
    

    func makeColorization(range:NSRange, color:UIColor, mask: CGImage) {
        guard let page, let pdfView else { return }
        guard let selection = page.selection(for: range) else { return }
        let pageBounds = selection.bounds(for: page)
        makeColorization(pageBounds: pageBounds, color: color, mask: mask)
    }
    
    func makeHighlight(range:NSRange, color:UIColor, popupView: UIView? = nil) {
        guard let page, let pdfView else { return }
        guard let selection = page.selection(for: range) else { return }
        let pageBounds = selection.bounds(for: page)
        makeHighlight(pageBounds: pageBounds, color: color, popupView: popupView)
    }
    
    func highlightView(at: CGPoint) -> UIView? {
        guard let atRect = rectForWord(at: at) else { return nil }
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
    
    func rectForWord(at: CGPoint) -> CGRect? {
        guard let page else { return nil }
        guard let selection = selection(at: at) else { return nil }
        let pageRect = selection.bounds(for: page)
        return convertFromPage(pageRect)
    }
    
    func rectFor(range: NSRange) -> CGRect? {
        guard let page else { return nil }
        guard let selection = page.selection(for: range) else { return nil }
        let pageRect = selection.bounds(for: page)
        return convertFromPage(pageRect)
    }
    

    
    func selection(at: CGPoint) -> PDFSelection? {
        guard let page, let pdfView else { return nil }
        let pdfViewPoint = pdfView.convert(at, from: self)
        let pagePoint = pdfView.convert(pdfViewPoint, to: page)
        let selection = page.selectionForWord(at: pagePoint)
        return selection
    }
    
    func doubleTouched(at: CGPoint) {
        if let highlightView = highlightView(at: at) as? ToggablePoppable {
            highlightView.togglePopupView()
        } else {
            guard let page else {return}
            guard let selection = selection(at: at) else {return}
//            print(selection)
            guard selection.numberOfTextRanges(on: page)>0 else {return}
            let r = selection.bounds(for: page) 
            makeHighlight(pageBounds: r, color: UIColor.red, popupView: PopupView(frame: CGRect(origin: CGPointZero, size: r.size), text: selection.string ?? "-----"))
        }
    }
    
    func touched(at: CGPoint) {
        if let highlightView = highlightView(at: at) as? ToggablePoppable {
            highlightView.togglePopupView()
        }
    }

}

