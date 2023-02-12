//
//  PageOverlay.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import UIKit
import PDFKit
import Highlightr
import Vision

extension String {
    func looksLikeProgrammingLanguage() -> Bool {
        let s = self
        return s.contains("<") || s.contains(">") || s.contains("}") || s.contains("{") || (s.contains(":") && s.contains("-")) || s.hasPrefix("//") || s.hasSuffix(";")
    }
}

extension CGRect {

    func verticalDistance(from rect: CGRect) -> CGFloat {
        if intersects(rect) {
            return 0
            
        }

        let mostLeft = origin.x < rect.origin.x ? self : rect
        let mostRight = rect.origin.x < self.origin.x ? self : rect

        var xDifference = mostLeft.origin.x == mostRight.origin.x ? 0 : mostRight.origin.x - (mostLeft.origin.x + mostLeft.size.width)
        xDifference = CGFloat(max(0, xDifference))

        let upper = self.origin.y < rect.origin.y ? self : rect
        let lower = rect.origin.y < self.origin.y ? self : rect

        var yDifference = upper.origin.y == lower.origin.y ? 0 : lower.origin.y - (upper.origin.y + upper.size.height)
        yDifference = CGFloat(max(0, yDifference))

        return yDifference
    }

}

@objc class PageOverlay : UIView {
    private static let highlightr = {
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "routeros")
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

    private var pdfAnnotationBorder:PDFBorder {
        let border = PDFBorder()
        border.lineWidth = 4.0
        border.style = .solid
        return border
    }
    
    private let scaleFactor:CGFloat = 2

    func makeCodeHighlights() {
        guard codeHighlights == nil else { return makeCodeHighlightViewsFromArray() }
        guard let page else { return }
        let pageSize = page.bounds(for: .mediaBox).size
        let imageSize = CGSize(width: pageSize.width * scaleFactor, height: pageSize.height * scaleFactor)
        let image = page.thumbnail(of: imageSize, for: .mediaBox)
        

        guard let cgImage = image.cgImage else { return }

        // Create a new image-request handler.
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)

        // Create a new request to recognize text.
        let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)

        do {
            // Perform the text-recognition request.
            try requestHandler.perform([request])
        } catch {
            print("Unable to perform the requests: \(error).")
        }

    }
    
    func recognizeTextHandler(request: VNRequest, error: Error?) {
        guard let page else {return }
        let pageSize = page.bounds(for: .mediaBox).size
        guard let observations =
                request.results as? [VNRecognizedTextObservation] else {
            return
        }
        
        
        let results: [(CGRect, String)] = observations.compactMap { observation in

            // Find the top observation.
            guard let candidate = observation.topCandidates(1).first else { return (.zero, "") }
            
            // Find the bounding-box observation for the string range.
            let stringRange = candidate.string.startIndex..<candidate.string.endIndex
            let boxObservation = try? candidate.boundingBox(for: stringRange)
            
            // Get the normalized CGRect value.
            let boundingBox = boxObservation?.boundingBox ?? .zero
            
            // Convert the rectangle from normalized coordinates to page coordinates.
            return (VNImageRectForNormalizedRect(boundingBox,
                                                Int(pageSize.width),
                                                Int(pageSize.height)),
                    candidate.string)
        }

        let processedTuples = results.map { (rect, text) -> (text: String, rect: CGRect, isProgrammingLanguage: Bool) in
            return (text, rect, text.looksLikeProgrammingLanguage())
        }

        let groupedTuples = processedTuples.reduce([(String, CGRect, Bool)]()) { (result, tuple) -> [(String, CGRect, Bool)] in
            guard let last = result.last else {
                return [tuple]
            }
            
            let (lastText, lastRect, lastIsProgrammingLanguage) = last
            let (text, rect, isProgrammingLanguage) = tuple
            
            if lastIsProgrammingLanguage && isProgrammingLanguage && rect.verticalDistance(from:lastRect) < 10 {
                return result.dropLast() + [(lastText + "\n" + text, lastRect.union(rect), true)]
            } else {
                return result + [tuple]
            }
        }

        let filteredTuples = groupedTuples.filter { (text, rect, isProgrammingLanguage) -> Bool in
            return isProgrammingLanguage
        }

        codeHighlights = [CGRect: String]()
        for (text, rect, _) in filteredTuples {
            codeHighlights![rect] = text
        }
        makeCodeHighlightViewsFromArray()

    }

    
    var highlightsViews = [CGRect : UIView]()
    var codeHighlights: [CGRect : String]? = nil

    func removeHighlights() {
        highlightsViews.forEach { (key: CGRect, value: UIView) in
            highlightsViews.removeValue(forKey: key)
            value.removeFromSuperview()
        }
    }
    
    private func makeCodeHighlightViewsFromArray() {
        guard let codeHighlights else { return }
        codeHighlights.forEach { (key: CGRect, value: String) in
            makeCodeHighlight(pageBounds: key, code: value)
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

    
    func makeHighlight(pageBounds:CGRect, color:UIColor, popupView: UIView? = nil) {
        guard let rect = convertFromPage(pageBounds) else { return }
        let v = HighlightView(frame: rect, color: color, popupView: popupView)
        highlightsViews[rect] = v
        addSubview(v)
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

