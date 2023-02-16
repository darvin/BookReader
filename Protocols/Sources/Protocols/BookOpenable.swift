//
//  File.swift
//  
//
//  Created by standard on 2/16/23.
//

import Foundation
import SwiftUI


public protocol BookOpenable {
    associatedtype Body : View

    var view: Body { get }
}
