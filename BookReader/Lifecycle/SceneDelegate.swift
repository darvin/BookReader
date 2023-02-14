//
//  SceneDelegate.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation


import UIKit
import SwiftUI

@objc class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            if connectionOptions.userActivities.first?.activityType == "window1" {
                window.rootViewController = UIHostingController(rootView: Window1())
            } else {
                window.rootViewController = HostingController(rootView: MainView())
            }

            self.window = window
            window.makeKeyAndVisible()
        }
    }

    


    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

}
