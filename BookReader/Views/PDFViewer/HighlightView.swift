//
//  HighlightView.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import UIKit


@objc class HighlightView : UIView {
    
    private var popupView: UIView
    
    init(frame: CGRect, text: String) {
        popupView = PopupView(frame: CGRect(origin: CGPointZero, size: frame.size), text: text)
        
        super.init(frame: frame)
        layer.backgroundColor = CGColor(red: 0, green: 0.3, blue: 0.1, alpha: 0.4)
        addSubview(popupView)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func togglePopupView() {
        popupView.isUserInteractionEnabled = !popupView.isUserInteractionEnabled
        popupView.isHidden = !popupView.isHidden

    }

}

