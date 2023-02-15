//
//  OpenPDFBookView.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import AVFoundation
import PDFKit
import SwiftUI
import PDFViewer
import Tools
import Models
import ViewModels
import UITools


public struct OpenPDFBookView: View {
    @Environment(\.presentationMode) var presentationMode

    @StateObject
    var viewModel: OpenBookViewModel

    public init(book: any BookPDFable) {
        _viewModel = StateObject(wrappedValue: OpenBookViewModel(book: book))
    }

    private func onDissmiss() {
        self.presentationMode.wrappedValue.dismiss()

    }

    private func prevPage() {
        NotificationCenter.default.post(name: MyPDFView.pdfViewPrevPage, object: nil)
    }
    private func nextPage() {
        NotificationCenter.default.post(name: MyPDFView.pdfViewNextPage, object: nil)
    }

    private func onTopTrailing() {
        prevPage()
    }

    private func onBottomTrailing() {
        nextPage()
    }

    private func onBottomLeading() {
        prevPage()
    }

    private func onTopLeading() {
        nextPage()
    }

    

    public var body: some View {
        if let data = viewModel.pdfData {
            GeometryReader { r in
                let buttonWidth = r.size.width / 8
                let buttonHeight = r.size.height / 2.3

                ZStack(alignment: .topLeading) {
                    PDFViewer.PDFKitRepresentedView(data: data, bookTitle: viewModel.book.title)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(Color.red)
                        .edgesIgnoringSafeArea(.all)
                        .navigationBarHidden(true)
                        .onAppear {
                            //fixme send notification

//                            setOrientationLandscape()
                        }
                        .onDisappear {
                            //fixme send notification
//                            setOrientationPortrait()

                        }
                        .onShake {
                            onDissmiss()
                        }
                    VStack {

                        HStack {
                            ClearButton {
                                onTopLeading()
                            }.frame(width: buttonWidth)
                            Spacer().frame(maxWidth: .infinity)
                            ClearButton {
                                onTopTrailing()
                            }.frame(width: buttonWidth, alignment: .trailing)

                        }.frame(height: buttonHeight)
                        Spacer().frame(maxHeight: .infinity)
                        HStack {
                            ClearButton {
                                onBottomLeading()
                            }.frame(width: buttonWidth)
                            Spacer().frame(maxWidth: .infinity)
                            ClearButton {
                                onBottomTrailing()
                            }.frame(width: buttonWidth, alignment: .trailing)

                        }.frame(height: buttonHeight, alignment: .bottomLeading)

                    }.frame(maxHeight: .infinity)
                        //                        .background(Color.green)
                        .ignoresSafeArea()

                }
            }
            .edgesIgnoringSafeArea(.all)
            .statusBarHidden()
            .persistentSystemOverlays(.hidden)

        }
        else {
            ProgressView().task {
                await viewModel.load()
            }
        }

    }
}

//struct OpenPDFBookView_Previews: PreviewProvider {
//    static var previews: some View {
//        OpenPDFBookView(
//            book: LocalBook(url: Bundle.main.url(forResource: "highlightjs", withExtension: "pdf")!)
//        )
//    }
//}
