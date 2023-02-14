//
//  CodeOverlayView.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import UIKit

extension String {

    var numberOfLines: Int {
        return self.components(separatedBy: "\n").count
    }

}

@objc class CodeOverlayView : UIView, ToggablePoppable {
    func togglePopupView() {
        label.isHidden = !label.isHidden
        if label.isHidden {
            layer.mask = maskLayer
            layer.backgroundColor = UIColor.clear.cgColor
        } else {
            layer.mask = nil
            layer.backgroundColor = UIColor.lightGray.cgColor
        }
        
        for layer in highlightLayers {
            layer.isHidden = !label.isHidden
        }
    }
    

    private var code: NSAttributedString
    private var label: UILabel
    private var maskLayer: CALayer
    private var highlightLayers: [CALayer] = []

    init(frame: CGRect, code: NSAttributedString, colors: [(CGRect, UIColor)], mask: CGImage) {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        label.attributedText = code
        label.backgroundColor = UIColor.white
        label.minimumScaleFactor = 0.1
        label.numberOfLines = code.string.numberOfLines
        label.font = UIFont.monospacedSystemFont(ofSize: 30.0, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.isHidden = true
        
        self.code = code
        
        self.maskLayer = CALayer()

        super.init(frame: frame)
        addSubview(label)

        for (rect, color) in colors {
            let l = CALayer()
            l.backgroundColor = color.cgColor.copy(alpha: 0.7)
            l.frame = rect
            layer.addSublayer(l)
            highlightLayers.append(l)
        }
        
        
        maskLayer.contents = mask
        maskLayer.frame = bounds
        maskLayer.opacity = 1.0
        layer.mask = maskLayer
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        setNeedsDisplay()
        setNeedsLayout()
    }

}
