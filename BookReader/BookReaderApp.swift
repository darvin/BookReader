//
//  BookReaderApp.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
        
    static var orientationLock = UIInterfaceOrientationMask.all 

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}


extension UIApplication {
    class func navigationTopViewController() -> UIViewController? {
            let nav = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
            return  nav?.topViewController
        }
}

@main
struct BookReaderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
