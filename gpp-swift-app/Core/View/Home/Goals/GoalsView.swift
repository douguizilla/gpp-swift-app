//
//  GoalsView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 0){
                    ForEach(Goal.sampleList.indices, id:\.self){ index in
                        let goal = Goal.sampleList[index]
                        NavigationLink(value: goal) {
                            GoalCell(
                                goal: goal, index: index, total: Goal.sampleList.count
                            )
                            .foregroundStyle(Color.primary)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Marcos temporais")
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(for: Goal.self) { goal in
            GoalDetailView(goal: goal)
        }
    }
    
    func GoalCell(
        goal: Goal,
        index: Int,
        total: Int
    )->some View {
        HStack(alignment: .bottom){
            VStack(spacing: 0){
                Rectangle()
                    .frame(width: 5)
                    .foregroundStyle(.blue)
                    .opacity(index == 0 ? 0 : 1)
                
                InfoCircle(topLabel: "25", botLabel: "JAN")
                
                Rectangle()
                    .frame(width: 5)
                    .foregroundStyle(.blue)
                    .opacity(index == total - 1 ? 0 : 1)
            }
            
            VStack(spacing: 12){
                GoalInfo(goal: goal)
                
                Divider()
                
                HStack{
                    Text("ver detalhes")
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .foregroundStyle(.blue)
            }
            .padding(.vertical, 8)
            .grayBackground(8)
            .padding(.vertical, 8)
        }
    }
}



#Preview {
    NavigationStack{
        GoalsView()
    }
}
