//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation




#if os(OSX)

import Cocoa
public  typealias PXColor = NSColor

#else

import UIKit
public  typealias PXColor = UIColor

#endif

public extension PXColor {

    func lighter(_ amount : CGFloat = 0.25) -> PXColor {
        return hueColorWithBrightnessAmount(amount: 1 + amount)
    }

    func darker(_ amount : CGFloat = 0.25) -> PXColor {
        return hueColorWithBrightnessAmount(amount: 1 - amount)
    }

    private func hueColorWithBrightnessAmount(amount: CGFloat) -> PXColor {
        var hue         : CGFloat = 0
        var saturation  : CGFloat = 0
        var brightness  : CGFloat = 0
        var alpha       : CGFloat = 0

        #if os(iOS)

            if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return PXColor( hue: hue,
                                saturation: saturation,
                                brightness: brightness * amount,
                                alpha: alpha )
            } else {
                return self
            }

            #else

            getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return PXColor( hue: hue,
                            saturation: saturation,
                            brightness: brightness * amount,
                            alpha: alpha )

        #endif

    }

}
