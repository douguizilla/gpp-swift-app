//
//  AddPublicationsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct AddPublicationsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var vehicleName = ""
    @State private var url = ""
    
    @State private var name = ""
    @State private var lastName = ""
    @State private var lattes = ""
    @State private var affiliation = ""
    
    var body: some View {
        VStack{
            List{
                Section("publicação"){
                    TextField("Título", text: $title)
                    TextField("Nome do veículo", text: $vehicleName)
                    TextField("URL", text: $url)
                }
                
                Section("add coautores na publicação (opcional)"){
                    TextField("Nome", text: $name)
                    TextField("Sobrenome", text: $lastName)
                    TextField("Lattes", text: $lattes)
                    TextField("Afiliação", text: $affiliation)
                }
                
                Button{
                    
                }label: {
                    HStack{
                        Spacer()
                        
                        Image(systemName: "plus")
                        
                        Text("ADICIONAR COAUTOR")
                        
                        Spacer()
                    }
                }
                
            }
        }
        .navigationTitle("Publicações")
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .bold()
                        .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        AddPublicationsView()
    }
}
