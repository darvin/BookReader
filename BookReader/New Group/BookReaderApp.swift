//
//  BookReaderApp.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import SwiftUI



extension UIApplication {
    class func navigationTopViewController() -> UIViewController? {
            let nav = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
            return  nav?.topViewController
        }
}



@main
struct BookReaderApp: App {
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            Text("")  // << temporary placeholder
                .withHostingWindow { window in
                    window?.rootViewController =
                         HostingController(rootView: MainView())
                }
        }

    }
}
