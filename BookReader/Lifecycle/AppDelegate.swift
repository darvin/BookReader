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
        
    override func buildMenu(with builder: UIMenuBuilder) {
        /** First check if the builder object is using the main system menu, which is the main menu bar.
            To check if the builder is for a contextual menu, check for: UIMenuSystem.context.
         */
        if builder.system == .main {
            menuController = MenuController(with: builder)
            
        }
    }
    
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
    @objc
    // User chose Open from the File menu.
    public func openAction(_ sender: AnyObject) {
//        present(documentPickerViewController, animated: true)
        

    }
}
