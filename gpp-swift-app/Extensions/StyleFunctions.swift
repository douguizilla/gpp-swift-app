//
//  StyleFunctions.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import SwiftUI

extension View {
    
    func grayBackground(_ padding: CGFloat = 0) -> some View {
        self
            .padding(padding)
            .padding(.horizontal, padding)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.thinMaterial)
            )
    }
    
    func buttonBackground() -> some View {
        self
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.blue)
            )
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

