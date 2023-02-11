//
//  ClearButton.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import SwiftUI

struct ClearButton: View {
    var action: () -> Void
    init(action: @escaping () -> Void) {
        self.action = action
    }
    var body: some View {
        Color //.clear
            .yellow.opacity(0.1)
            .contentShape(Rectangle())
            .onTapGesture {
                action()
            }
    }
}
