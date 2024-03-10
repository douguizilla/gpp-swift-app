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
    
    var body: some View {
        VStack(spacing: 16){
            VStack(alignment: .leading){
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
                
            }label: {
                Text("Solicitar token")
                    .buttonBackground()
            }
        }
        .blueBackground()
    }
}

#Preview {
    NavigationStack{
        ForgotPasswordRequestView()
            .environmentObject(NavigationManager())
    }
}
