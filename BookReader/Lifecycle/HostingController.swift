//
//  HostingController.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import UIKit
import SwiftUI

class HostingController: UIHostingController<MainView> {
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    
    func makePDFViewController(url:URL) -> UIViewController {
        return OpenPDFBookViewController(url:url)
    }
    

    lazy var documentPickerViewController:UIDocumentPickerViewController = {
        let vc = UIDocumentPickerViewController(documentTypes: ["com.adobe.pdf"], in: .open)
        vc.allowsMultipleSelection = false
        vc.delegate = self
        return vc
    }()


    @objc
    // User chose Open from the File menu.
    public func openAction(_ sender: AnyObject) {
        present(documentPickerViewController, animated: true)
        

    }

}

extension HostingController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        let url = urls[0]
        let vc = makePDFViewController(url: url)
        present(vc, animated: true)

    }
}



extension View {
    func withHostingWindow(_ callback: @escaping (UIWindow?) -> Void) -> some View {
        self.background(HostingWindowFinder(callback: callback))
    }
}

struct HostingWindowFinder: UIViewRepresentable {
    var callback: (UIWindow?) -> ()

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async { [weak view] in
            self.callback(view?.window)
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
}
