//
//  BookReaderApp.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import PDFViewer
import Protocols
import SwiftUI
#if !targetEnvironment(macCatalyst)
    import TelegramReader
#endif

@main
public struct BookReaderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var showingDocumentPicker = false
    @State private var filePathURL: URL?

    public init() {
        #if !targetEnvironment(macCatalyst)
            TelegramReaderInitialize()
        #endif
    }

    public var body: some Scene {
        WindowGroup(Scenes.MainScene.rawValue) {
            MainView()
                .sheet(isPresented: $showingDocumentPicker) {
                    DocumentPicker(filePath: $filePathURL)
                }
        }
        .commands {
            CommandGroup(replacing: .importExport) {
                Button("Open File") {
                    showingDocumentPicker = true
                }.keyboardShortcut("o")
            }
            CommandMenu("Navigation") {
                Button("Prev Page") {
                    NotificationCenter.default.post(name: MyPDFView.pdfViewPrevPage, object: nil)
                }
                .keyboardShortcut("/", modifiers: [])
                .keyboardShortcut(KeyEquivalent.leftArrow, modifiers: [])
                Button("Next Page") {
                    NotificationCenter.default.post(name: MyPDFView.pdfViewNextPage, object: nil)
                }
                .keyboardShortcut(KeyEquivalent.space, modifiers: [])
                .keyboardShortcut(KeyEquivalent.rightArrow, modifiers: []) // fixme only first seems to work
            }
        }
    }
}
