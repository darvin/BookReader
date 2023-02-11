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

    var body: some View {
        //FIXME causes cycle error, fixme
        if let data = viewModel.pdfData {
            PDFKitRepresentedView(data)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.red)
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
                .onAppear {
                            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                            AppDelegate.orientationLock = .landscape
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
