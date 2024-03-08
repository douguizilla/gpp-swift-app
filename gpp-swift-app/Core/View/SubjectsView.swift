//
//  SubjectsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct SubjectsView: View {
    var body: some View {
        VStack{
            List{
                ProgressBar(
                    title: "Seus resultados:",
                    value: 25,
                    total: 26,
                    label: "créditos totais"
                )
                
                Section("INTEGRA EM DISCIPLINAS"){
                    Text("25 créditos")
                }
                
                Section("INTEGRA EM SEMINÁRIO"){
                    Text("1 crédito")
                }
                
                Section("2 SEMESTRE"){
                    ForEach(0..<3){_ in
                        SubjectCell()
                    }
                }
                
                Section("1 SEMESTRE"){
                    ForEach(0..<3){_ in
                        SubjectCell()
                    }
                }
                
                
                
            }
        }
        .navigationTitle("Disciplinas")
        .navigationBarTitleDisplayMode(.large)
        .background(.thinMaterial)
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
            
            VStack(alignment: .leading){
                Text("Analise de Algoritmos")
                    .font(.headline)
                Text("FAZENDO")
                    .foregroundStyle(.white)
                    .font(.caption2)
                    .bold()
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .foregroundColor(.blue)
                    )
                
            }
        }
    }
}

#Preview {
    NavigationStack{
        SubjectsView()
    }
}
