//
//  CodeOverlayView.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import UIKit
import Highlightr
extension String {

    var numberOfLines: Int {
        return self.components(separatedBy: "\n").count
    }

}

@objc class CodeOverlayView : UIView {
    private static let highlightr = {
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "routeros")
        return highlightr
    }()
    
    private var code: String
    private var label: UILabel
    init(frame: CGRect, code: String) {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        label.text = code
        label.backgroundColor = UIColor.white
        label.minimumScaleFactor = 0.1
        label.numberOfLines = code.numberOfLines
        label.font = UIFont.monospacedSystemFont(ofSize: 30.0, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        self.code = code
        super.init(frame: frame)
        addSubview(label)
        layer.backgroundColor = UIColor.lightGray.cgColor.copy(alpha: 0.8)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        label.attributedText = CodeOverlayView.highlightr?.highlight(code)
    }

}
