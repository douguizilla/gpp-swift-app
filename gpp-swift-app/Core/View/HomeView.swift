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
            VStack{
                Text("Seus resultados:")
                    .fontWeight(.semibold)
            }
        }
        .navigationTitle("Olá, Douglas!")
    }
}

#Preview {
    NavigationStack{
        HomeView()
    }
}
