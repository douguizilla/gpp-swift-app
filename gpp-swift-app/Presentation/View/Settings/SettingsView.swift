//
//  SettingsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 09/03/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var viewModel : InnerViewModel
    
    var body: some View {
        VStack{
            List{
                Section{
                    Toggle(isOn: $viewModel.settingsToggle){
                        Text("Ativar notificações sobre os marcos temporais")
                            .font(.footnote)
                    }
                }
            }
        }
        .background(Color(.secondarySystemBackground))
        .navigationTitle("Configurações")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack{
        SettingsView()
            .environmentObject(InnerViewModel())
    }
}
