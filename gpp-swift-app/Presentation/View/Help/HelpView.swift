//
//  HelpView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 09/03/24.
//

import SwiftUI

struct HelpView: View {
    @EnvironmentObject var model : InnerViewModel
    @State var search: String = ""
    var body: some View {
        VStack{
            List{
                ForEach(model.faqList, id: \.id){ faq in
                    NavigationLink(value: faq) {
                        FaqItem(faq: faq)
                    }
                }
            }
            .searchable(text: $search)
            .navigationDestination(for: Faq.self) { item in
                HelpDetailView(faq: item)
            }
        }
        .navigationTitle("Ajuda")
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    
                }label:{
                    Image(systemName: "envelope")
                }
            }
        }
    }
    
    func FaqItem(faq: Faq) -> some View {
        Text(faq.question)
            .font(.body)
            .padding(10)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    NavigationStack{
        HelpView()
            .environmentObject(InnerViewModel())
    }
}
