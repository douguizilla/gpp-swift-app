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
            .padding()
            .background(
                Circle()
                    .foregroundColor(.blue)
            )
            
            Text("Analise de Algoritmos")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .horizontalAlignment(.leading)
            
            Button{
                
            }label: {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
                    .font(.caption2)
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                    )
            }
            .padding(.trailing)

        }
    }
}

#Preview {
    NavigationStack{
        AddSubjectsView()
    }
}
