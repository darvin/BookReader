//
//  MyPDFView.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import PDFKit
import UIKit

public class MyPDFView: PDFView {
    public static let pdfViewNextPage = Notification.Name("MyPDFView_pdfViewNextPage")

    public static let pdfViewPrevPage = Notification.Name("MyPDFView_pdfViewPrevPage")

    private var pdfViewHandler: PDFViewHandler

    override public func willMove(toWindow _: UIWindow?) {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(nextPage(notification:)),
            name: Self.pdfViewNextPage,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(prevPage(notification:)),
            name: Self.pdfViewPrevPage,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func nextPage(notification _: Notification) {
        turnPage()
    }

    @objc func prevPage(notification _: Notification) {
        turnPage(false)
    }

    init(frame: CGRect, bookTitle: String) {
        pdfViewHandler = PDFViewHandler()
        pdfViewHandler.bookTitle = bookTitle

        super.init(frame: frame)
        autoScales = true
        pageShadowsEnabled = false
        backgroundColor = UIColor.white
        let scrollView = subviews[0] as! UIScrollView
        scrollView.backgroundColor = UIColor.systemBackground

        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollView.contentInsetAdjustmentBehavior = .never

        pageBreakMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        pdfViewHandler.pdfView = self
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PDFView {
    var scrollView: UIScrollView? {
        for subview in subviews {
            if let scrollView = subview as? UIScrollView {
                return scrollView
            } else if let pdfView = subview as? PDFView {
                return pdfView.scrollView
            } else if let scrollView = subview.subviews.lazy.compactMap({ $0 as? UIScrollView }).first {
                return scrollView
            } else if let pdfView = subview.subviews.lazy.compactMap({ $0 as? PDFView }).first {
                return pdfView.scrollView
            }
        }
        return nil
    }
}

public extension PDFView {
    func turnPage(_ isForwardDirection: Bool = true) {
        guard let scrollView = scrollView else { return }
        let overlapHeight = 20.0
        let offsetY = scrollView.contentOffset.y + (isForwardDirection ? scrollView.bounds.height - overlapHeight : -scrollView.bounds.height + overlapHeight)

        let offsetX = scrollView.contentOffset.x
        let contentSize = scrollView.contentSize

        if offsetY >= 0, offsetY <= contentSize.height - scrollView.bounds.height {
            let newOffset = CGPoint(x: offsetX, y: offsetY)
            UIView.animate(withDuration: 0.01) {
                scrollView.contentOffset = newOffset
            }
        }
    }
}
