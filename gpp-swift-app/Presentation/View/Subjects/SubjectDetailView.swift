//
//  SubjectDetailView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct SubjectDetailView: View {
    @EnvironmentObject private var model : InnerViewModel
    @Environment(\.dismiss) private var dismiss
    
    @Binding var subject: Subject
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 20){
                    Text(subject.title)
                        .font(.title)
                        .bold()
                        .horizontalAlignment(.leading)
                    
                    if subject.status != .NAO_MATRICULADO {
                        Menu {
                            ForEach(SubjectStatus.allCases, id: \.self){ status in
                                Button(status.display){
                                    self.subject.status = status
                                }
                            }
                        } label: {
                            HStack(spacing: 16){
                                Text(self.subject.status.display)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(.white)
                                    .frame(width: 20, height: 20)
                                    .bold()
                                    .background(
                                        Circle()
                                            .frame(width: 25, height: 25)
                                            .foregroundStyle(.black)
                                            .opacity(0.3)
                                    )
                            }
                            .padding(10)
                            .background(
                                Capsule()
                                    .foregroundStyle(self.subject.status.color)
                            )
                        }
                        .horizontalAlignment(.leading)
                    }
                    
                    GLabel(label: "Grupo", value: subject.group)
                    GLabel(label: "Créditos", value: subject.credits)
                    GLabel(label: "Carga horária", value: subject.workload)
                    GLabel(label: "Objetivos Gerais", value: subject.generalObjectives)
                    GLabel(label: "Ficha da disciplina", value: subject.url)
                }
                .padding()
                .onChange(of: subject.status) { status in
                    if status == .NAO_MATRICULADO {
                        dismiss.callAsFunction()
                        model.removeUserSubject(subject)
                    }
                }
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
            + Text(LocalizedStringKey(value))
                
        }
        .horizontalAlignment(.leading)
        
    }
}

#Preview {
    NavigationStack{
        SubjectDetailView(subject: .constant(Subject.sampleList[0]))
    }
}
