//
//  ProfileView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 09/03/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var viewModel : InnerViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            List{
                Section("dados pessoais"){
                    HStack{
                        Text("Nome: ").bold()
                        TextField("", text: $viewModel.profile.name)
                    }
                    HStack{
                        Text("Matrícula: ").bold()
                        TextField("", text: $viewModel.profile.registerID)
                    }
                    HStack{
                        Text("Data de ingresso: ").bold()
                        TextField("", text: $viewModel.profile.entryDate)
                    }
                    HStack{
                        Text("Data de início da bolsa: ").bold()
                        TextField("", text: $viewModel.profile.scholarShipStartDate)
                    }
                    HStack{
                        Text("E-mail: ").bold()
                        TextField("", text: $viewModel.profile.email)
                    }
                    HStack{
                        Text("Lattes: ").bold()
                        TextField("", text: $viewModel.profile.lattes)
                    }
                }
                
                Section("dados do projeto"){
                    HStack{
                        Text("Título: ").bold()
                        TextField("", text: $viewModel.profile.title)
                    }
                    HStack{
                        Text("Linha de pesquisa: ").bold()
                        TextField("", text: $viewModel.profile.lineOfResearch)
                    }
                    HStack{
                        Text("Categoria: ").bold()
                        TextField("", text: $viewModel.profile.category)
                    }
                    HStack{
                        Text("Orientador: ").bold()
                        TextField("", text: $viewModel.profile.advisor)
                    }
                    HStack{
                        Text("E-mail do orientador: ").bold()
                        TextField("", text: $viewModel.profile.advisorEmail)
                    }
                    HStack{
                        Text("Coorientadores: ").bold()
                        TextField("", text: $viewModel.profile.coadvisor)
                    }
                    HStack{
                        Text("Data de início: ").bold()
                        TextField("", text: $viewModel.profile.startDate)
                    }
                    HStack{
                        Text("Data de fim: ").bold()
                        TextField("", text: $viewModel.profile.endDate)
                    }
                }
            }
            
            Button{
                dismiss.callAsFunction()
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
            .environmentObject(InnerViewModel())
    }
}
