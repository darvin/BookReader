//
//  HostingController.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import UIKit
import SwiftUI

struct Window1: View {
    var body: some View {
        Text("Window1")
    }
}


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


   

}

extension HostingController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        let url = urls[0]
        UIApplication.shared.requestSceneSessionActivation(nil,
                                                           userActivity: NSUserActivity(activityType: "window1"),
                                                           options: nil,
                                                           errorHandler: nil)

//        if UIApplication.shared.canOpenURL(url) {
//            UIApplication.shared.open(url)
//        }



    }
}


