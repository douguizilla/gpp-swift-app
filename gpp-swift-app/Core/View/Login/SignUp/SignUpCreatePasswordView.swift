//
//  SignUpCreatePasswordView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct SignUpCreatePasswordView: View {
    @EnvironmentObject var navigation : NavigationManager
    
    @State private var showNewPassword = false
    @State private var newPassword = ""
    
    @State private var showConfirmPassword = false
    @State private var confirmPassword = ""
    
    @State private var lattes = ""
        
    var body: some View {
        VStack(spacing: 16){
            HStack{
                Image("ufu-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                
                Text("Cadastrar")
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            PasswordTextField("Nova senha", text: $newPassword, showPassword: $showNewPassword)
                .capsuleFieldStyle()
            
            PasswordTextField("Confirmar senha", text: $confirmPassword, showPassword: $showConfirmPassword)
                .capsuleFieldStyle()
            
            TextField("Link do lattes", text: $lattes)
                .capsuleFieldStyle()
            
            Button{
                navigation.logout()
            }label: {
                Text("Confirmar")
                    .buttonBackground()
            }
        }
        .blueBackground()
    }
}

#Preview {
    SignUpCreatePasswordView()
}
