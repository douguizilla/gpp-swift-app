//
//  AddSubjectsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct AddSubjectsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var search = ""
    var body: some View {
        VStack{
            List{
                ForEach(0..<20, id: \.self){_ in
                    SubjectCell()
                }
            }
        }
        .navigationTitle("Disciplinas")
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
        .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    func SubjectCell() -> some View {
        HStack{
            VStack{
                Text("PGC")
                Text("001")
            }
            .bold()
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .bold))
            .background(
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 50)
                
            )
            
            Spacer()
            
            Text("Analise de Algoritmos")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            
            Spacer()
            
            Button{
                
            }label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15)
                    .foregroundStyle(.white)
                    .font(.caption2)
                    .bold()
                    .background(
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 40)
                    )
            }

        }
        .padding()
    }
}

#Preview {
    NavigationStack{
        AddSubjectsView()
    }
}
