//
//  PopupView.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import UIKit


@objc class PopupView : UIView {
    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        let labelOffsetY = -frame.size.height - 2.0
        let l = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: labelOffsetY), size: frame.size))
        l.text = text //.translate()
        l.textAlignment = .center
//        layer.backgroundColor = CGColor(red: 0.3, green: 0.2, blue: 0.2, alpha: 0.8)
        l.textColor = UIColor.brown
        l.adjustsFontSizeToFitWidth = true
        l.backgroundColor = UIColor.gray
        addSubview(l)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
