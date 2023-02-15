//
//  LoginView+Welcome.swift
//  Moc
//
//  Created by Егор Яковенко on 23.06.2022.
//

import SwiftUI
import TDLibKit

extension LoginView {
    var welcome: some View {
        VStack {
            Group {
                Text("Login To Telegram")
                    .font(.system(size: 36, weight: .bold))
                Text("Choose your login method")
                Button {
                    Task {
                        try? await service.requestQrCodeAuth()
                    }
                } label: {
                    Label("Continue using QR Code", systemImage: "qrcode")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding(.bottom, 8)
                .padding(.top, 56)
                Button {
                    openedScreen = .phoneNumber
                } label: {
                    Label("Continue using phone number", systemImage: "phone")
                }
                .controlSize(.large)
            }
        }
    }
}
