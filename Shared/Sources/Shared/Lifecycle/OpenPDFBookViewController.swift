//
//  OpenPDFBookViewController.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation
import SwiftUI
import UIKit
import Books

class OpenPDFBookViewController: UIHostingController<Books.OpenPDFBookView> {
    let book: any Books.BookPDFable
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    init(url: URL) {
        book = Books.LocalBook(url: url)
        let view = Books.OpenPDFBookView(book: book)
        super.init(rootView: view)
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
