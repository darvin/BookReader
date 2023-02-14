//
//  MyAppDelegate.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation
import UIKit

//@UIApplicationMain
@objc class AppDelegate: UIResponder, UIApplicationDelegate {
        
    static var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    
    
    
    var menuController: MenuController!
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return true
    }
    
    override func buildMenu(with builder: UIMenuBuilder) {
        /** First check if the builder object is using the main system menu, which is the main menu bar.
            To check if the builder is for a contextual menu, check for: UIMenuSystem.context.
         */
        if builder.system == .main {
            menuController = MenuController(with: builder)
            
        }
    }
}
