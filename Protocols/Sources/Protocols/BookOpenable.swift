//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import SwiftUI


public protocol BookOpenable {
    associatedtype BookOpenableView : View

    var view: BookOpenableView { get }
}
