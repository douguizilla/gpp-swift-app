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
                        NavigationLink(value: Subject.sampleList[0]) {
                            SubjectCell(Subject.sampleList[0])
                        }
                    }
                }
                
                Section("1 SEMESTRE"){
                    ForEach(0..<3){_ in
                        NavigationLink(value: Subject.sampleList[0]) {
                            SubjectCell(Subject.sampleList[0])
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
            SubjectDetailView(subject: .constant(subject))
        }
    }
    
    func SubjectCell(_ subject: Subject) -> some View {
        HStack(alignment: .top){
            InfoCircle(
                topLabel: subject.codeString.0,
                botLabel: subject.codeString.1,
                isDate: false
            )
            
            VStack(alignment: .leading){
                Text(subject.title)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(subject.status.display)
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
            .environmentObject(InnerViewModel())
    }
}
