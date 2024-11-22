//
//  PublicationsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct PublicationsView: View {
    @EnvironmentObject var viewModel : InnerViewModel
    
    @State private var showAddPublicationsView = false
    var body: some View {
        VStack{
            
            List{
                if viewModel.userPublicationsList.isEmpty{
                    Section{
                        Text("Nenhuma publicação cadastrada")
                            .horizontalAlignment(.center)
                        
                        Button{
                            showAddPublicationsView.toggle()
                        }label: {
                            Text("Adicionar publicação")
                                .horizontalAlignment(.center)
                        }
                    }
                }else{
                    ForEach(viewModel.userPublicationsList, id: \.id){ publication in
                        NavigationLink(value: publication){
                            PublicationCell(publication)
                                .swipeActions(allowsFullSwipe: true){
                                    Button{
                                        withAnimation{
                                            viewModel.removePublication(publication)
                                        }
                                    }label:{
                                        Image(systemName: "trash")
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }
            }
        }
        .navigationTitle("Publicações")
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(for: Publication.self){ publication in
            let index = viewModel.userPublicationsList.firstIndex(where: {
                $0.id == publication.id
            })
            PublicationDetailView(publication: $viewModel.userPublicationsList[index!])
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    showAddPublicationsView.toggle()
                }label: {
                    Image(systemName: "plus")
                        .bold()
                        .foregroundStyle(Color.primary)
                }
            }
        }
        .sheet(isPresented: $showAddPublicationsView){
            NavigationStack{
                AddPublicationsView()
            }
        }
    }
    
    func PublicationCell(_ publication: Publication)->some View {
        VStack(alignment: .leading){
            Text(publication.title)
                .font(.headline)
            
            HStack{
                Text(publication.vehicleName)
                Spacer()
                Text("22/11/2024")
            }
            .font(.subheadline)
        }
    }
}

#Preview {
    NavigationStack{
        PublicationsView()
            .environmentObject(InnerViewModel())
    }
}
