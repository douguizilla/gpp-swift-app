//
//  GoalInfo.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct GoalInfo : View {
    var goal : Goal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(goal.title)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .font(.title2)
                .bold()
            
            Label("Prazo: \(goal.date) - em 302 dias", systemImage: "hourglass.tophalf.filled")
                .font(.subheadline)
                .bold()
            
            Text("Status: \(goal.status)")
                .font(.subheadline)
            
            Text(goal.description)
                .lineLimit(2)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GoalInfo(goal: Goal.sample)
}
