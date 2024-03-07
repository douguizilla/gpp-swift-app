//
//  ProgressBar.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import SwiftUI

struct ProgressBar : View {
    let title : String
    let value : CGFloat
    let total : CGFloat
    var label : String = ""
    
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                let width = proxy.size.width
                
                Text(title)
                    .fontWeight(.semibold)
                    .frame(width: width, alignment: .leading)
                
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(uiColor: .systemGray4))
                        .frame(height: 30)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.blue)
                        .frame(width: (((width * value) / total) * width) / width, height: 30, alignment: .trailing)
                    
                }
                
                Text("\(Int(value))/\(Int(total)) \(label)")
                    .fontWeight(.semibold)
                    .frame(width: width, alignment: .trailing)
            }
        }
    }
}

