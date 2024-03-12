//
//  SubjectDetailView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct SubjectDetailView: View {
    @Binding var subject: Subject
    @State private var status : SubjectStatus = .NAO_MATRICULADO
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 20){
                    Text(subject.title)
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
                            subject.status = self.status
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
                    
                    GLabel(label: "Grupo", value: subject.group)
                    GLabel(label: "Créditos", value: subject.credits)
                    GLabel(label: "Carga horária", value: subject.workload)
                    GLabel(label: "Objetivos Gerais", value: subject.generalObjectives)
                    GLabel(label: "Ficha da disciplina", value: subject.url)
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
        SubjectDetailView(subject: .constant(Subject.sampleList[0]))
    }
}
