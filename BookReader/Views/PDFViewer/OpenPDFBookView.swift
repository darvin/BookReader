//
//  OpenPDFBookView.swift
//  BookReader
//
//  Created by standard on 2/9/23.
//

import SwiftUI
import PDFKit
import AVFoundation
extension CGPoint: HashableSynthesizable { }
extension CGRect: HashableSynthesizable { }


struct OpenPDFBookView: View {
    @Environment(\.presentationMode) var presentationMode

    @StateObject
    var viewModel: OpenBookViewModel
    
    
    init(book: any BookPDFable) {
        _viewModel = StateObject(wrappedValue: OpenBookViewModel(book: book))
    }
    
    private let pdfViewHandler = PDFViewHandler()
    private let pdfView = {
        
        let p = PDFView()

        p.autoScales = true
        p.pageShadowsEnabled = false

        #if true
            p.backgroundColor = UIColor.gray
            p.pageBreakMargins = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
        #else
            p.pageBreakMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        #endif
        return p
    }()
    
    private func onDissmiss() {
        self.presentationMode.wrappedValue.dismiss()

    }
    
    private func nextPage() {
        print("next page")
    }
    
    private func prevPage() {
        print("prev page")

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

    
    private func setOrientationPortrait() {
        AppDelegate.orientationLock = .portrait
//                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
        UIApplication.navigationTopViewController()?.setNeedsUpdateOfSupportedInterfaceOrientations()

    }
    
    private func setOrientationLandscape() {
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        AppDelegate.orientationLock = .landscape

    }
    
    private func loadPDFData(_ data: Data) {
        pdfViewHandler.pdfView = pdfView
        pdfView.document = PDFDocument(data: data)

    }

    var body: some View {
        if let data = viewModel.pdfData {
            GeometryReader { r in
                let buttonWidth = r.size.width / 19
                let buttonHeight = r.size.height / 2.3
                
                ZStack(alignment: .topLeading) {
                    PDFKitRepresentedView(pdfView: pdfView)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(Color.red)
                        .edgesIgnoringSafeArea(.all)
                        .navigationBarHidden(true)
                        .onAppear {
                            setOrientationLandscape()
                            loadPDFData(data)
                        }
                        .onDisappear {
                            setOrientationPortrait()
                            
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
        } else {
            ProgressView().task {
                await viewModel.load()
            }
        }
        
    }
}









struct OpenPDFBookView_Previews: PreviewProvider {
    static var previews: some View {
        OpenPDFBookView(book: GutenFetcher.dummyBooks[33])
    }
}
