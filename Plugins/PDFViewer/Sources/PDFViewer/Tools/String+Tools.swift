//
//  String+Tools.swift
//  BookReader
//
//  Created by standard on 2/14/23.
//

import Foundation

extension String {
    var removeSpaces: String {
        let components = self.components(separatedBy: NSCharacterSet.whitespaces)
        let filtered = components.filter({ !$0.isEmpty })
        return filtered.joined(separator: "")
    }
}

extension String {

    var numberOfLines: Int {
        return self.components(separatedBy: "\n").count
    }

}
