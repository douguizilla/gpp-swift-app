//
//  SubjectDetailView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

enum SubjectStatus : CaseIterable {
    case MATRICULADO
    case NAO_MATRICULADO
    case NOTA_A
    case NOTA_B
    case NOTA_C
    case NOTA_D
    case NOTA_E
    
    var display : String {
        switch self {
        case .MATRICULADO:
            "MATRICULADO"
        case .NAO_MATRICULADO:
            "NÃO MATRICULADO"
        case .NOTA_A:
            "NOTA A"
        case .NOTA_B:
            "NOTA B"
        case .NOTA_C:
            "NOTA C"
        case .NOTA_D:
            "NOTA D"
        case .NOTA_E:
            "NOTA E"
        }
    }
    
    var color : Color {
        switch self {
        case .MATRICULADO:
                return .blue
        case .NAO_MATRICULADO:
            return Color(.systemGray)
        case .NOTA_A, .NOTA_B, .NOTA_C:
            return .green
        case .NOTA_D, .NOTA_E:
            return .red
        }
    }
}

struct SubjectDetailView: View {
    @State private var status : SubjectStatus = .NAO_MATRICULADO
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 20){
                    Text("Metodologia de Pesquisa em Computação")
                        .font(.title)
                        .bold()
                        .horizontalAlignment(.leading)
                    
                    Menu {
                        ForEach(SubjectStatus.allCases, id: \.self){ status in
                            Button(status.display){
                                self.status = status
                            }
                        }
                    } label: {
                        Button{
                            
                        }label: {
                            HStack(spacing: 16){
                                Text(self.status.display)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(.white)
                                    .frame(width: 20, height: 20)
                                    .bold()
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 25, height: 25)
                                            .foregroundStyle(.black)
                                            .opacity(0.3)
                                    )
                            }
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundStyle(self.status.color)
                            )
                        }
                    }
                    .horizontalAlignment(.leading)
                    
                    GLabel(label: "Grupo", value: "Núcleo de Formação Teórica")
                    GLabel(label: "Créditos", value: "5")
                    GLabel(label: "Carga horária", value: "90 horas")
                    GLabel(label: "Objetivos Gerais", value: "Introduzir as técnicas básicas de eficiência de algoritmos, com cálculo de tempo de pior caso e tempo médio. Isto é feito com a apresentação de um grande número de algoritmos que servem de ponto de partida para o desenvolvimento de novos algoritmos. Considera-se também uma introdução ao estudo comparativo dos principais métodos de computação, particularmente nos aspectos de complexidade de tempo e de espaço de problemas computacionais. ")
                    GLabel(label: "Ficha da disciplina", value: "http://www.ppgco.facom.ufu.br/disciplinas/analise-de-algoritmos")
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func GLabel(
        label: String,
        value: String
    ) -> some View {
        HStack{
            Text("\(label): ")
                .bold()
            + Text(value)
                
        }
        .horizontalAlignment(.leading)
        
    }
}

#Preview {
    NavigationStack{
        SubjectDetailView()
    }
}
