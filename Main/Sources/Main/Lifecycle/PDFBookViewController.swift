//
//  OpenPDFBookViewController.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation
import SwiftUI
import UIKit
import Models
import LocalReader
import Views

class PDFBookViewController: UIHostingController<PDFBookView> {
    let book: any BookPDFable
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    init(url: URL) {
        book = LocalBook(url: url)
        let view = PDFBookView(book: book)
        super.init(rootView: view)
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
