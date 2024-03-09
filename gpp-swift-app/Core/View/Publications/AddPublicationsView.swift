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
    
    @State private var coauthorList : [Coauthor] = [
        Coauthor(
            name: "Douglas",
            lastName: "Gomes",
            lattes: "www.yt.com",
            affiliation: "salinha"
        )
    ]
    
    var body: some View {
        VStack{
            List{
                Section("publicação"){
                    TextField("Título", text: $title)
                    TextField("Nome do veículo", text: $vehicleName)
                    TextField("URL", text: $url)
                }
                
                if !coauthorList.isEmpty {
                    Section("coautores da publicação"){
                        ForEach(coauthorList, id: \.id){ coauthor in
                            VStack(alignment: .leading){
                                Text(coauthor.name + " " + coauthor.lastName)
                                    .font(.headline)
                                
                                Text(coauthor.lattes)
                                    .font(.subheadline)
                                
                                Text(coauthor.affiliation)
                                    .font(.subheadline)
                            }
                            .swipeActions(allowsFullSwipe: true) {
                                Button{
                                    withAnimation{
                                        self.coauthorList.removeAll(where: {
                                            $0.id == coauthor.id
                                        })
                                    }
                                }label:{
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                        }
                    }
                }
                
                Section("add coautores na publicação (opcional)"){
                    TextField("Nome", text: $name)
                    TextField("Sobrenome", text: $lastName)
                    TextField("Lattes", text: $lattes)
                    TextField("Afiliação", text: $affiliation)
                }
                
                Button{
                    let coauthor = Coauthor(
                        name: name,
                        lastName: lastName,
                        lattes: lattes,
                        affiliation: affiliation
                    )
                    
                    coauthorList.append(coauthor)
                    
                }label: {
                    HStack{
                        Spacer()
                        
                        Image(systemName: "plus")
                        
                        Text("ADICIONAR COAUTOR")
                        
                        Spacer()
                    }
                }
                
            }
            
            Button{
                
            }label:{
                Text("Salvar")
                    .buttonBackground()
            }
            .padding()
        }
        .background(Color(.secondarySystemBackground))
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

struct Coauthor : Identifiable {
    let id = UUID().uuidString
    var name = ""
    var lastName = ""
    var lattes = ""
    var affiliation = ""
    
}

#Preview {
    NavigationStack{
        AddPublicationsView()
    }
}
