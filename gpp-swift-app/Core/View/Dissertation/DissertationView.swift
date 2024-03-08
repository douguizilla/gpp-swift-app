//
//  DissertationView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct DissertationView: View {
    var body: some View {
        VStack{
            List{
                Section("INTEGRA"){
                    Text("18 créditos")
                }
                
                Section("pré-requisitos para matrícula"){
                    
                    VStack{
                        Text("O projeto de Dissertação de Mestrado deverá ser apresentado pelo estudante até o final do segundo semestre letivo, contado a partir da matrícula de ingresso como aluno regular.")
                            .font(.caption2)
                        
                        HStack(spacing: 0){
                            Text("1 Semestre")
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .horizontalAlignment(.center)
                                .padding(5)
                                .background(
                                    Rectangle()
                                        .foregroundStyle(.blue)
                                        .clipShape(
                                            .rect(topLeadingRadius: 5, bottomLeadingRadius: 5, bottomTrailingRadius: 0, topTrailingRadius: 0)
                                        )
                                )
                            
                            Text("2 Semestre")
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .horizontalAlignment(.center)
                                .padding(5)
                                .background(
                                    Rectangle()
                                        .foregroundStyle(.blue)
                                        .clipShape(
                                            .rect(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 5, topTrailingRadius: 5)
                                        )
                                )
                                .opacity(0.5)
                        }
                    }
                    
                    ProgressBar(
                        title: "Obtenção de, no mínimo, 15 créditos:",
                        value: 3,
                        total: 15,
                        label: "créditos totais",
                        font: .caption2,
                        height: 65
                    )
                    
                    VStack(alignment: .leading){
                        Text("Aprovação do Projeto de Dissertação de Mestrado pelo Colegiado:")
                            .font(.caption2)
                        
                        Text("Em análise")
                            .font(.footnote)
                            .foregroundStyle(.white)
                            .horizontalAlignment(.leading)
                            .padding(5)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.blue)
                            )
                    }
                    
                }
                
                Section("pré-requisitos para defesa"){
                    VStack(alignment: .leading){
                        Text("Aprovação do Projeto de Dissertação de Mestrado pelo Colegiado:")
                            .font(.caption2)
                        
                        ForEach(1..<8){ index in
                            HStack(alignment: .top){
                                Circle()
                                    .frame(width: 25, height: 25)
                                
                                Text("Regra \(index) - idasidhais hdiashdi ahsd ihadiahsidh")
                                    .multilineTextAlignment(.leading)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .opacity(0.5)
                
            }
        }
        .navigationTitle("Dissertação")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack{
        DissertationView()
    }
}
