//
//  MyAppDelegate.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation
import UIKit

class MyAppDelegate: NSObject, UIApplicationDelegate {
        
    static var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return MyAppDelegate.orientationLock
    }
    

}
