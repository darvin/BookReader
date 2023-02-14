//
//  BookReaderApp.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI


@main
struct BookReaderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var showingDocumentPicker = false
    @State private var filePathURL: URL?

    var body: some Scene {
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
        }
    }
    
}
