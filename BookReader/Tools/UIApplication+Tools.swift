//
//  UIApplication+Tools.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation
import UIKit


extension UIApplication {
    class func navigationTopViewController() -> UIViewController? {
            let nav = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
            return  nav?.topViewController
        }
}
