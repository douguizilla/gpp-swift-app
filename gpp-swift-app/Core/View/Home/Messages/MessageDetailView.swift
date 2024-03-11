//
//  MessageDetailView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct MessageDetailView: View {
    @State var message: Message
    
    init(message: Message = Message.sample) {
        self._message = State(wrappedValue: message)
    }
    var body: some View {
        ScrollView{
            VStack(spacing: 16){
                HStack{
                    Text(message.title)
                        .font(.largeTitle)
                        .bold()
                        .horizontalAlignment(.leading)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Text(message.date)
                }
                
                Text(message.text)
                
                Text(message.sender)
                    .horizontalAlignment(.leading)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    self.message.isRead = !message.isRead
                }label: {
                    Text(self.message.isRead ? "marcar não como lido" : "marcar como lido")
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        MessageDetailView()
    }
}
