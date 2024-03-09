//
//  SettingsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 09/03/24.
//

import SwiftUI

struct SettingsView: View {
    @State var active = false
    var body: some View {
        VStack{
            List{
                Section{
                    Toggle(isOn: $active){
                        Text("Ativar notificações sobre os marcos")
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
    }
}
