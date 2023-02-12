//
//  FontColorizationOverlayView.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation

import UIKit


@objc class FontColorizationOverlayView : UIView {
    init(frame: CGRect, mask: CGImage, color:UIColor) {
        super.init(frame: frame)
        print("CCCC \(color)")
        layer.backgroundColor = color.withAlphaComponent(1.0).cgColor

        let maskLayer = CALayer()
        maskLayer.contents = mask
        maskLayer.frame = bounds
        maskLayer.opacity = 1.0
//        maskLayer.backgroundColor = color.cgColor

        layer.mask = maskLayer
 
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

