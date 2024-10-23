//
//  ChangePasswordView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 09/03/24.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    @State private var showCurrentPassword = false
    @State private var showNewPassword = false
    @State private var showConfirmPassword = false
    
    var body: some View {
        VStack{
            List{
                Section{
                    PasswordTextField("Senha atual", text: $currentPassword, showPassword: $showCurrentPassword)
                    PasswordTextField("Nova senha", text: $newPassword, showPassword: $showNewPassword)
                    PasswordTextField("Confirmar senha", text: $confirmPassword, showPassword: $showConfirmPassword)
                }
            }
            
            Button{
                
            }label: {
                Text("Salvar")
                    .buttonBackground()
            }
            .padding()
        }
        .background(Color(.secondarySystemBackground))
        .navigationTitle("Alterar senha")
        .navigationBarTitleDisplayMode(.large)
    }
    
}

#Preview {
    NavigationStack{
        ChangePasswordView()
    }
}
