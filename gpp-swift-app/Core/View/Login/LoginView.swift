//
//  LoginView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var navigation = NavigationManager()
    
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        NavigationStack(
            path: $navigation.path
        ){
            ZStack(alignment: .bottom){
                VStack(spacing: 16){
                    VStack{
                        Image("ufu-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                        
                        Text("PÓS")
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    TextField("E-mail", text: $email)
                        .capsuleFieldStyle()
                    
                    PasswordTextField("Senha", text: $password, showPassword: $showPassword)
                        .capsuleFieldStyle()
                    
                    Button{
                        navigation.navigate(to: LoginScreen.home)
                    }label: {
                        Text("Entrar")
                            .buttonBackground()
                    }
                    
                    Button{
                        navigation.navigate(to: LoginScreen.forgotPassword)
                    }label: {
                        Text("Esqueceu a senha?")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(.borderless)
                    .padding()
                    
                    Button{
                        navigation.navigate(to: LoginScreen.signUp)
                    }label: {
                        HStack{
                            Text("Ainda não tem conta? ") + Text("Cadastre-se").bold()
                        }
                        .foregroundStyle(.white)
                    }
                    .buttonStyle(.borderless)
                }
                .padding()
                .padding(.vertical,62)
                .background(
                    Rectangle()
                        .foregroundStyle(Color.backgroundBlue)
                        .clipShape(
                            .rect(topLeadingRadius: 50, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 50)
                        )
                        .ignoresSafeArea()
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(
                Image("backgroundImage")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
            )
            .navigationDestination(for: LoginScreen.self) { screen in
                switch screen {
                case .home:
                    HomeView()
                        .navigationBarBackButtonHidden()
                case .signUp:
                    Text("Cadastro")
                case .forgotPassword:
                    Text("Esqueci a senha")
                }
            }
        }
        .environmentObject(navigation)
    }
}

#Preview {
    LoginView()
}
