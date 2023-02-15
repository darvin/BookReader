//
//  HostingController.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import SwiftUI
import UIKit

class HostingController: UIHostingController<MainView> {
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}
