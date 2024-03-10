//
//  GoalDetailVierw.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct GoalDetailView: View {
    var goal: Goal = Goal.sample
    var body: some View {
        VStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 10){
                    Text("Número do processo SEI: ")
                        .bold()
                    + Text(goal.numberSEI)
                    
                    Text("Data prevista: ")
                        .bold()
                    + Text(goal.date)
                    
                    HStack{
                        Text("Documentação obrigatória: ")
                            .bold()
                        
                        Text(goal.hasMandatoryDocLabel)
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                Capsule()
                                    .fill(goal.hasMandatoryDocLabelColor)
                            )
                    }
                    
                    Text("Descrição: ")
                        .bold()
                    + Text(goal.description)
                    
                    Text("Reunião do colegiado: ")
                        .bold()
                    + Text(goal.collegiateMeeting)
                    
                    Text("Créditos: ")
                        .bold()
                    + Text(goal.credits)
                    
                    if goal.hasMandatoryDoc {
                        Button{
                            
                        }label: {
                            Text("Adicionar documentação")
                                .buttonBackground(short: true)
                        }
                    }
                    
                }
                .horizontalAlignment(.leading)
                .padding()
            }
            
            Button{
                
            }label: {
                Text("Enviar")
                    .buttonBackground()
                    .padding()
            }
        }
        .navigationTitle(goal.title)
    }
}

#Preview {
    NavigationStack{
        GoalDetailView()
    }
}
