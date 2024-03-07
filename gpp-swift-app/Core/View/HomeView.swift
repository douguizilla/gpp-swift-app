//
//  HomeView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigation : NavigationManager
    
    var body: some View {
        VStack(spacing: 16){
            
            ProgressBar(
                title: "Seus resultados:",
                value: 21,
                total: 44,
                label: "créditos totais"
            )
            .grayBackground(8)
            
            HStack{
                GButton(
                    systemName: "person",
                    label: "Disciplinas"
                )
                .grayBackground()
                
                Spacer()
                
                GButton(
                    systemName: "person",
                    label: "Publicações"
                )
                .grayBackground()
                
                Spacer()
                
                GButton(
                    systemName: "person",
                    label: "Dissertação"
                )
                .grayBackground()
                
            }
            
        }
        .navigationTitle("Olá, Douglas!")
        .padding()
    }
    
    func GButton(
        iconName: String = "",
        systemName: String = "",
        label: String,
        action: @escaping () -> Void = {}
    ) -> some View {
        Button{
            
        }label: {
            VStack(spacing: 10){
                Image(systemName: systemName)
                
                Text(label)
                    .fontWeight(.semibold)
                    .font(.caption)
            }
            .foregroundColor(.primary)
            .padding(16)
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
    }
}
