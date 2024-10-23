//
//  PasswordTextField.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 09/03/24.
//

import SwiftUI

struct PasswordTextField : View {
    var placeholder : String
    var text: Binding<String>
    var showPassword: Binding<Bool>
    
    init(_ placeholder: String, text: Binding<String>, showPassword: Binding<Bool>) {
        self.placeholder = placeholder
        self.text = text
        self.showPassword = showPassword
    }
    
    var body: some View {
        HStack{
            if showPassword.wrappedValue {
                TextField(placeholder, text: text)
            }else{
                SecureField(placeholder, text: text)
            }
            
            Button{
                showPassword.wrappedValue.toggle()
            }label: {
                Image(systemName: showPassword.wrappedValue ? "eye" : "eye.slash")
                    .foregroundStyle(Color(.systemGray))
            }
            .buttonStyle(.borderless)
        }
    }
}
