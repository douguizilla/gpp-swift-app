//
//  ForgotPasswordView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct ForgotPasswordRequestView: View {
    @EnvironmentObject var navigation : NavigationManager
    
    @State private var email = ""
    
    @State private var navigate = false
    
    var body: some View {
        VStack(spacing: 16){
            HStack{
                Image("ufu-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                
                Text("Esqueceu a senha")
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            TextField("E-mail", text: $email)
                .capsuleFieldStyle()
            
            Button{
                navigate.toggle()
            }label: {
                Text("Solicitar token")
                    .buttonBackground()
            }
        }
        .blueBackground()
        .navigationDestination(isPresented: $navigate) {
            ForgotPasswordTokenValidationView()
        }
    }
}

#Preview {
    NavigationStack{
        ForgotPasswordRequestView()
            .environmentObject(NavigationManager())
    }
}
