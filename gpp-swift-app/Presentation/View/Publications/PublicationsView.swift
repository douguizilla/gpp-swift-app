//
//  PublicationsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct PublicationsView: View {
    @State private var showAddPublicationsView = false
    var body: some View {
        VStack{
            List{
                ForEach(1..<5){ value in
                    PublicationCell(value: value)
                }
            }
        }
        .navigationTitle("Publicações")
        .navigationBarTitleDisplayMode(.large)
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
    
    func PublicationCell(value: Int)->some View {
        VStack(alignment: .leading){
            Text("Publicação \(value)")
                .font(.headline)
            
            HStack{
                Text("Nome do veículo")
                Spacer()
                Text("0\(value)/0\(value)/2024")
            }
            .font(.subheadline)
        }
    }
}

#Preview {
    NavigationStack{
        PublicationsView()
    }
}
