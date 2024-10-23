//
//  ForgotPasswordTokenValidationView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct ForgotPasswordTokenValidationView: View {
    @EnvironmentObject var navigation : NavigationManager
    
    @State private var token = ""
    
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
            
            
            TextField("Token", text: $token)
                .capsuleFieldStyle()
            
            Button{
                navigate.toggle()
            }label: {
                Text("Validar token")
                    .buttonBackground()
            }
            
            Button{
                
            }label: {
                Text("Reenviar token")
                    .secondaryButtonBackground()
            }
        }
        .blueBackground()
        .navigationDestination(isPresented: $navigate) {
            ForgotPasswordChangeView()
        }
    }
}

#Preview {
    NavigationStack{
        ForgotPasswordTokenValidationView()
            .environmentObject(NavigationManager())
    }
}
