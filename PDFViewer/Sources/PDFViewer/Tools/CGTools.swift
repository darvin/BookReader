//
//  CGTools.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation

extension CGRect {

    func convert(from fromRect: CGRect, to toRect: CGRect) -> CGRect {
        let rect = self
        let x = (rect.origin.x - fromRect.origin.x) + toRect.origin.x
        let y = (rect.origin.y - fromRect.origin.y) + toRect.origin.y
        let width = rect.size.width
        let height = rect.size.height

        return CGRect(x: x, y: y, width: width, height: height)
    }
}
