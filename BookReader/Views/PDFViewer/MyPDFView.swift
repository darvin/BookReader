//
//  MyPDFView.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import PDFKit
import UIKit

class MyPDFView: PDFView {
    static let pdfViewNextPage = Notification.Name("MyPDFView_pdfViewNextPage")

    static let pdfViewPrevPage = Notification.Name("MyPDFView_pdfViewPrevPage")

    private var pdfViewHandler: PDFViewHandler

    override func willMove(toWindow newWindow: UIWindow?) {
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

    @objc func nextPage(notification: Notification) {
        turnPage()
    }
    @objc func prevPage(notification: Notification) {
        turnPage(false)
    }

    init(frame: CGRect, book: any BookMetadatable) {
        pdfViewHandler = PDFViewHandler()
        pdfViewHandler.book = book

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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func turnPage(_ isForwardDirection: Bool = true) {
        if let currentPage = currentPage, let document = document {
            let visibleRect = CGRect(origin: CGPointZero, size: bounds.size)
            let currentRect = convert(visibleRect, to: currentPage)

            let y =
                isForwardDirection
                ? currentRect.origin.y - currentRect.size.height
                : currentRect.origin.y + currentRect.size.height

            var newPage = currentPage
            print("y \(y) maxY \(currentPage.bounds(for: .mediaBox).size.height)")
            if (y + 2.0) > currentPage.bounds(for: .mediaBox).size.height {
                if let prevPage = document.page(at: document.index(for: currentPage) - 1) {
                    newPage = prevPage
                    //fixme coords
                }
            }

            let nextRect = CGRect(
                origin:
                    CGPoint(
                        x: currentRect.origin.x,
                        y: y
                    ),
                size: currentRect.size
            )

            print("CURR: \(currentRect)")
            print("NEXT: \(nextRect)")
            go(to: nextRect, on: newPage)
        }

    }
}
