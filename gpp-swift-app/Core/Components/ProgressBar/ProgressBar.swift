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
        VStack{
            GeometryReader{ proxy in
                VStack{
                    let width = proxy.size.width
                    
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: width, alignment: .leading)
                    
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(uiColor: .systemGray3))
                            .frame(height: 25)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.blue)
                            .frame(width: (((width * value) / total) * width) / width, height: 25, alignment: .trailing)
                        
                    }
                    
                    Text("\(Int(value))/\(Int(total)) \(label)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: width, alignment: .trailing)
                }
            }
        }
        .frame(height: 95)
    }
}

