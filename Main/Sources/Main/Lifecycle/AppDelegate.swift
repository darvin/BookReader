//
//  MyAppDelegate.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation
import UIKit
import UITools


@objc class AppDelegate: UIResponder, UIApplicationDelegate {

    static var orientationLock = UIInterfaceOrientationMask.all

    func application(
        _ application: UIApplication,
        supportedInterfaceOrientationsFor window: UIWindow?
    ) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        NotificationCenter.default.addObserver(self, selector: #selector(requestOrientationPortrait(notification:)), name: ScreenOrienationNotifications.requestOrientationPortrait, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(requestOrientationLandscape(notification:)), name: ScreenOrienationNotifications.requestOrientationLandscape, object: nil)

        return true
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
    
    @objc func requestOrientationPortrait(notification: Notification) {
        AppDelegate.orientationLock = .portrait
        //                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
        UIApplication.navigationTopViewController()?
            .setNeedsUpdateOfSupportedInterfaceOrientations()

    }

    @objc func requestOrientationLandscape(notification: Notification) {
        UIDevice.current.setValue(
            UIInterfaceOrientation.landscapeLeft.rawValue,
            forKey: "orientation"
        )
        AppDelegate.orientationLock = .landscape

    }

}
