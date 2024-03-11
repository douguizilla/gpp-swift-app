//
//  MessagesView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack{
            List{
                ForEach(0..<7, id: \.self){ _ in
                    MessageCell()
                }
            }
        }
        .navigationTitle("Recados")
        .navigationBarTitleDisplayMode(.large)
    }
    
    func MessageCell()->some View {
        VStack(alignment: .leading){
            Text("Recado 1")
                .font(.headline)
            
            HStack{
                Text("Descrição")
                Spacer()
                Text("dd/MM/AAAA")
            }
            .font(.subheadline)
        }
    }
}

#Preview {
    NavigationStack{
        MessagesView()
    }
}
