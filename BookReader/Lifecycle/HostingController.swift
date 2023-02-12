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
