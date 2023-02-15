//
//  ScreenOrienationNotifications.swift
//  
//
//  Created by standard on 2/15/23.
//

import Foundation

public struct ScreenOrienationNotifications {
    public static let requestOrientationPortrait = Notification.Name("AppDelegate_requestOrientationPortrait")
    public static let requestOrientationLandscape = Notification.Name("AppDelegate_requestOrientationLandscape")
}
