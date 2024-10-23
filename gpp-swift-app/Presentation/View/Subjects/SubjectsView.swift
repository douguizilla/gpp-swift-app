//
//  SubjectsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct SubjectsView: View {
    @EnvironmentObject var viewModel : InnerViewModel
    
    @State private var showAddSubjectsView = false
    
    var body: some View {
        VStack{
            List{
                ProgressBar(
                    title: "Seus resultados:",
                    value: 0,
                    total: 26,
                    label: "créditos totais"
                )
                
                Section("INTEGRA EM DISCIPLINAS"){
                    Text("25 créditos")
                }
                
                Section("INTEGRA EM SEMINÁRIO"){
                    Text("1 crédito")
                }
                
                if viewModel.userSubjectListIsEmpty() {
                    Section{
                        Text("Nenhuma disciplina cadastrada")
                            .horizontalAlignment(.center)
                        
                        Button{
                            showAddSubjectsView.toggle()
                        }label: {
                            Text("Adicionar disciplinas")
                                .horizontalAlignment(.center)
                        }
                    }
                }else{
                    ForEach(viewModel.separetedUserList, id: \.self){ section in
                        let semester = section.first?.semester ?? 1
                        let subjects = section
                        Section("\(semester)º SEMESTRE"){
                            ForEach(subjects, id: \.self){ subject in
                                NavigationLink(value: subject) {
                                    SubjectCell(subject)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Disciplinas")
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    showAddSubjectsView.toggle()
                }label: {
                    Image(systemName: "plus")
                        .bold()
                        .foregroundStyle(Color.primary)
                }
            }
        }
        .sheet(isPresented: $showAddSubjectsView){
            NavigationStack{
                AddSubjectsView()
            }
            .environmentObject(viewModel)
        }
        .navigationDestination(for: Subject.self) { subject in
            let index = viewModel.userSubjectsList.firstIndex(where: {
                $0.id == subject.id
            })
            SubjectDetailView(
                subject: $viewModel.userSubjectsList[index!]
            )
        }
    }
    
    func SubjectCell(_ subject: Subject) -> some View {
        HStack(alignment: .top){
            let index = viewModel.userSubjectsList.firstIndex(where: {
                $0.id == subject.id
            })
            
            InfoCircle(
                topLabel: subject.codeString.0,
                botLabel: subject.codeString.1,
                isDate: false
            )
            
            VStack(alignment: .leading){
                Text(subject.title)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(viewModel.userSubjectsList[index!].status.display)
                    .foregroundStyle(.white)
                    .font(.caption2)
                    .bold()
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .foregroundColor( 
                                viewModel.userSubjectsList[index!].status.color
                            )
                    )
                
            }
        }
    }
}

#Preview {
    NavigationStack{
        SubjectsView()
            .environmentObject(InnerViewModel())
    }
}
