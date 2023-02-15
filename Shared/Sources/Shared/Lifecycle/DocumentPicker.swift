//
//  DocumentPicker.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation
import SwiftUI
import UIKit
import UniformTypeIdentifiers

struct DocumentPicker: UIViewControllerRepresentable {

    @Binding var filePath: URL?

    func makeCoordinator() -> DocumentPicker.Coordinator {
        return DocumentPicker.Coordinator(parent1: self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>)
        -> UIDocumentPickerViewController
    {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [
            UTType.pdf
        ])

        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(
        _ uiViewController: DocumentPicker.UIViewControllerType,
        context: UIViewControllerRepresentableContext<DocumentPicker>
    ) {
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {

        var parent: DocumentPicker

        init(parent1: DocumentPicker) {
            parent = parent1
        }
        func documentPicker(
            _ controller: UIDocumentPickerViewController,
            didPickDocumentsAt urls: [URL]
        ) {
            let url: URL = urls[0]
            parent.filePath = url
            print(urls[0].absoluteString)

            let activity = NSUserActivity(activityType: Scenes.OpenPDFBookScene.rawValue)
            activity.userInfo = [ScenesUserInfoKeyURL: url.absoluteString]
            activity.targetContentIdentifier = Scenes.OpenPDFBookScene.rawValue
            UIApplication.shared.requestSceneSessionActivation(
                nil,
                userActivity: activity,
                options: nil
            )

        }
    }
}
