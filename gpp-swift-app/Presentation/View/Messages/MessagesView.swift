//
//  MessagesView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import SwiftUI

struct MessagesView: View {
    @State private var messages = Message.sampleList
    var body: some View {
        VStack{
            List{
                ForEach(messages.indices, id: \.self){ index in
                    NavigationLink(value: messages[index]) {
                        MessageCell(messages[index])
                            .foregroundStyle(Color.primary)
                            .swipeActions{
                                Button{
                                    messages[index].isRead = !messages[index].isRead
                                }label: {
                                    Image(
                                        systemName: messages[index].isRead ? "message.badge.filled.fill" : "message.fill"
                                    )
                                }
                                .tint(messages[index].isRead ? .gray : .blue)
                            }
                    }
                }
            }
        }
        .navigationTitle("Recados")
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(for: Message.self) { message in
            MessageDetailView(message: message)
        }
    }
    
    func MessageCell(_ message: Message)->some View {
        VStack(alignment: .leading){
            HStack{
                Text(message.title)
                    .font(.headline)
                    .horizontalAlignment(.leading)
                
                Text(message.date)
                    .font(.subheadline)
                    
            }
            
            Text(message.text)
                .multilineTextAlignment(.leading)
                .horizontalAlignment(.leading)
                .lineLimit(2)
                .font(.subheadline)
        }
        .foregroundStyle(message.isRead ? Color.primary.opacity(0.4) : Color.primary)
    }
}

#Preview {
    NavigationStack{
        MessagesView()
    }
}
