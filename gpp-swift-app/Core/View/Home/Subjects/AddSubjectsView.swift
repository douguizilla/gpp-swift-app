//
//  AddSubjectsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 08/03/24.
//

import SwiftUI

struct AddSubjectsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel : InnerViewModel
    
    @State private var search = ""
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.subjectsList, id: \.self){ subject in
                    SubjectCell(subject)
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
        .navigationDestination(for: Subject.self) { subject in
            SubjectDetailView(subject: .constant(subject))
        }
    }
    
    func SubjectCell(_ subject: Subject) -> some View {
        HStack{
            
            HStack{
                InfoCircle(
                    topLabel: subject.codeString.0,
                    botLabel: subject.codeString.1,
                    isDate: false
                )
                
                Spacer()
                
                Text(subject.title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .horizontalAlignment(.leading)
                
                Spacer()
            }
            .contentShape(Rectangle())
            .background(
                NavigationLink(value: subject) {
                    EmptyView()
                }.opacity(0)
            )
            
            Button{
                viewModel.addUserSubject(subject)
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
            .buttonStyle(.borderless)
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    NavigationStack{
        AddSubjectsView()
            .environmentObject(InnerViewModel())
    }
}
