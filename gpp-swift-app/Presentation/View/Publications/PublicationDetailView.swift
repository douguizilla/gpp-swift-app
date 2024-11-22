//
//  PublicationDetailView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 21/11/24.
//

import SwiftUI

struct PublicationDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var publication: Publication
    
    @State private var name = ""
    @State private var lastName = ""
    @State private var lattes = ""
    @State private var affiliation = ""
        
    var body: some View {
        VStack{
            List{
                Section("publicação"){
                    TextField("Título", text: $publication.title)
                    TextField("Nome do veículo", text: $publication.vehicleName)
                    TextField("URL", text: $publication.url)
                }
                
                if !publication.coauthors.isEmpty {
                    Section("coautores da publicação"){
                        ForEach(publication.coauthors, id: \.id){ coauthor in
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
                                        publication.coauthors.removeAll(where: {
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
                    
                    publication.coauthors.append(coauthor)
                    
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
                dismiss.callAsFunction()
            }label:{
                Text("Salvar")
                    .buttonBackground()
            }
            .padding()
        }
        .background(Color(.secondarySystemBackground))
        .navigationTitle("Publicações")
        .navigationBarTitleDisplayMode(.large)
    }
}

