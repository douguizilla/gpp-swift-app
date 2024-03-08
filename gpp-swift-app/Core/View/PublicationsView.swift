//
//  PublicationsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct PublicationsView: View {
    var body: some View {
        VStack{
            List{
                ForEach(1..<5){ _ in
                    PublicationCell()
                }
            }
        }
        .navigationTitle("Publicações")
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                }label: {
                    Image(systemName: "plus")
                        .bold()
                        .foregroundStyle(Color.primary)
                }
            }
        }
    }
    
    func PublicationCell()->some View {
        VStack(alignment: .leading){
            Text("Publicação 1")
                .font(.headline)
            
            HStack{
                Text("Nome do veículo")
                Spacer()
                Text("dd/MM/AAAA")
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
