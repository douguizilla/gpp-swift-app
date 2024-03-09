//
//  ProfileView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 09/03/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            List{
                Section("dados pessoais"){
                    TextField("Nome", text: .constant(""))
                    TextField("Matrícula", text: .constant(""))
                    TextField("Data de ingresso", text: .constant(""))
                    TextField("Data de início da bolsa", text: .constant(""))
                    TextField("E-mail", text: .constant(""))
                    TextField("Lattes", text: .constant(""))
                }
                
                Section("dados do projeto"){
                    TextField("Título", text: .constant(""))
                    TextField("Linha de pesquisa", text: .constant(""))
                    TextField("Categoria", text: .constant(""))
                    TextField("Orientador", text: .constant(""))
                    TextField("E-mail do orientador", text: .constant(""))
                    TextField("Coorientadores", text: .constant(""))
                    TextField("Data de início", text: .constant(""))
                    TextField("Data de fim", text: .constant(""))
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
        .navigationTitle("Perfil")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack{
        ProfileView()
    }
}
