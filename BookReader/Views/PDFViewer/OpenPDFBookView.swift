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
            p.backgroundColor = UIColor.red
            p.pageBreakMargins = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
        #else
            p.pageBreakMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        #endif
        return p
    }()

    var body: some View {
        //FIXME causes cycle error, fixme
        if let data = viewModel.pdfData {

            PDFKitRepresentedView(pdfView: pdfView)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.red)
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
                .onAppear {
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                    AppDelegate.orientationLock = .landscape
                    pdfViewHandler.pdfView = pdfView
                    pdfView.document = PDFDocument(data: data)

                }
                .onDisappear {
                    

                    AppDelegate.orientationLock = .portrait
//                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                    windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
                    UIApplication.navigationTopViewController()?.setNeedsUpdateOfSupportedInterfaceOrientations()


                }
                .onShake {
                    self.presentationMode.wrappedValue.dismiss()

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
