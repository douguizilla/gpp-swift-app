//
//  StyleFunctions.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import SwiftUI

extension View {
    
    var hasNotch: Bool {
        let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let firstWindow = firstScene?.windows.first
        let safeAreaInsetsBottom = firstWindow?.safeAreaInsets.bottom ?? 0
        return safeAreaInsetsBottom > 0
    }
    
    func grayBackground(_ padding: CGFloat = 0) -> some View {
        self
            .padding(padding)
            .padding(.horizontal, padding)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.thinMaterial)
            )
    }
    
    func buttonBackground(short: Bool = false) -> some View {
        self
            .bold()
            .foregroundStyle(.white)
            .frame(maxWidth: short ? nil : .infinity)
            .padding()
            .background(
                Capsule()
                    .foregroundStyle(.blue)
                    .frame(height: 50)
            )
    }
    
    func secondaryButtonBackground(short: Bool = false) -> some View {
        self
            .bold()
            .foregroundStyle(Color.primary)
            .frame(maxWidth: short ? nil : .infinity)
            .padding()
            .background(
                Capsule()
                    .foregroundStyle(
                        Color(UIColor.systemBackground)
                    )
                    .frame(height: 50)
            )
    }
    
    
    
    func blueBackground() -> some View {
        ZStack(alignment: .bottom){
            self
                .padding()
                .padding(.vertical, 50)
                .background(
                    Rectangle()
                        .foregroundStyle(Color.backgroundBlue)
                        .clipShape(
                            .rect(topLeadingRadius: 50, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 50)
                        )
                        .ignoresSafeArea()
                )
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .bottom
        )
        .background(
            Image("backgroundImage")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
        )
    }
    
    func capsuleFieldStyle() -> some View {
        self
            .padding()
            .background(
                Capsule()
                    .foregroundStyle(
                        Color(UIColor.systemBackground)
                    )
                    .frame(height: 50)
            )
    }
    
    func paddingNotch() -> some View {
        self
            .padding(.top, hasNotch ? 40 : 0)
    }
    
    func verticalAlignment(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func horizontalAlignment(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    
}

