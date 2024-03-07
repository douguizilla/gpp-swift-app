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
        VStack{
            
                ProgressBar(
                    title: "Seus resultados:",
                    value: 21,
                    total: 44,
                    label: "créditos totais"
                )
                .grayBackground()
            
            
            Text("teste")
            
        }
        .navigationTitle("Olá, Douglas!")
        .padding()
    }
}

#Preview {
    NavigationStack{
        HomeView()
    }
}
