//
//  UIImage+Tools.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation
import UIKit

public extension UIImage {
    func
    imageByMakingWhiteBackgroundTransparent() -> UIImage? {

        let image = UIImage(data: self.jpegData(compressionQuality: 1.0)!)!
        let rawImageRef: CGImage = image.cgImage!

        let maskingFrom: CGFloat = 88
        let maskingTo:CGFloat = 255
        let colorMasking: [CGFloat] = [
            maskingFrom, maskingTo,
            maskingFrom, maskingTo,
            maskingFrom, maskingTo]
        UIGraphicsBeginImageContext(image.size);

        let maskedImageRef = rawImageRef.copy(maskingColorComponents: colorMasking)
        UIGraphicsGetCurrentContext()?.translateBy(x: 0.0,y: image.size.height)
        UIGraphicsGetCurrentContext()?.scaleBy(x: 1.0, y: -1.0)
        UIGraphicsGetCurrentContext()?.draw(maskedImageRef!, in: CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height))
        let result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return result

    }

}
