//
//  LoginView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var navigation = NavigationManager()
    
    var body: some View {
        NavigationStack(
            path: $navigation.path
        ){
            VStack{
                Button{
                    navigation.navigate(to: LoginScreen.home)
                }label: {
                    Text("Entrar")
                }
            }
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
