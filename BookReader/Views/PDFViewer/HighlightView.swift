//
//  HighlightView.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import UIKit


@objc class HighlightView : UIView {
    
    private var popupView: UIView?
    
    init(frame: CGRect, color:UIColor = UIColor(cgColor: CGColor(red: 0, green: 0.3, blue: 0.1, alpha: 0.4)),  popupView: UIView? = nil) {
        if let popupView {
            self.popupView = popupView
        }
        super.init(frame: frame)
        layer.backgroundColor = color.cgColor
        if let popupView {
            addSubview(popupView)
        }

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func togglePopupView() {
        guard let popupView else {return}
        popupView.isUserInteractionEnabled = !popupView.isUserInteractionEnabled
        popupView.isHidden = !popupView.isHidden

    }

}

