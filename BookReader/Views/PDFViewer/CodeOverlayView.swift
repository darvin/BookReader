//
//  CodeOverlayView.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import UIKit
@objc class CodeOverlayView : UIView {
        
    init(frame: CGRect, code: String) {
    
        super.init(frame: frame)
        layer.backgroundColor = UIColor.lightGray.cgColor.copy(alpha: 0.4)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
