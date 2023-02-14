//
//  SceneDelegate.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation


import UIKit
import SwiftUI

enum Scenes: String {
    case MainScene = "MainScene"
    case OpenPDFBookScene = "OpenPDFBookScene"
}

let ScenesUserInfoKeyURL = "OpenPDFBookSceneURL"

@objc class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private func makeDefaultViewController() -> UIViewController {
        return HostingController(rootView: MainView())
    }
    
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            if let activity = connectionOptions.userActivities.first,
                activity.activityType == Scenes.OpenPDFBookScene.rawValue,
               let urlString = (activity.userInfo?[ScenesUserInfoKeyURL]) as? String {
                   let url = URL(string: urlString)
                window.rootViewController = OpenPDFBookViewController(url:url!)

            } else {
                window.rootViewController = makeDefaultViewController()
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
