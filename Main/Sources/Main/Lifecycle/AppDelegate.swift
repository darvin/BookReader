//
//  MyAppDelegate.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation
import UIKit

@objc class AppDelegate: UIResponder, UIApplicationDelegate {

    static var orientationLock = UIInterfaceOrientationMask.all

    func application(
        _ application: UIApplication,
        supportedInterfaceOrientationsFor window: UIWindow?
    ) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfig: UISceneConfiguration = UISceneConfiguration(
            name: nil,
            sessionRole: connectingSceneSession.role
        )
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
    
    private func setOrientationPortrait() {
        AppDelegate.orientationLock = .portrait
        //                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
        UIApplication.navigationTopViewController()?
            .setNeedsUpdateOfSupportedInterfaceOrientations()

    }

    private func setOrientationLandscape() {
        UIDevice.current.setValue(
            UIInterfaceOrientation.landscapeLeft.rawValue,
            forKey: "orientation"
        )
        AppDelegate.orientationLock = .landscape

    }

}
