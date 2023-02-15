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

class OpenPDFBookViewController: UIHostingController<OpenPDFBookView> {
    let book: any BookPDFable
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    init(url: URL) {
        book = LocalBook(url: url)
        let view = OpenPDFBookView(book: book)
        super.init(rootView: view)
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}