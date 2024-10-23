//
//  InfoCircle.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct InfoCircle : View {
    var topLabel : String
    var botLabel: String
    var isDate: Bool = true
    
    var body: some View {
        VStack(spacing: 0){
            if isDate {
                Text(topLabel)
                    .font(.headline)
            }else{
                Text(topLabel)
            }
            
            Text(botLabel)
        }
        .bold()
        .foregroundColor(.white)
        .font(.caption)
        .frame(width: 50, height: 50)
        .background(
            Circle()
                .foregroundColor(.blue)
                .frame(width: 50, height: 50)
        )
        .clipShape(Circle())
    }
}

