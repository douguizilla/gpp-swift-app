//
//  HelpDetailView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 24/10/24.
//

import SwiftUI

struct HelpDetailView: View {
    let faq: Faq
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 12){
                Text(faq.question)
                    .font(.title2)
                    .bold()
                    .horizontalAlignment(.leading)
                
                Courses(faq.course)
                
                Label("Público-alvo: ", text: faq.targetAudience)
                
                Label("Assunto: ", text: faq.subject)
                
                Text(faq.answer)
                    .multilineTextAlignment(.leading)
                
                Topics(faq.topics)
                
            }
            .padding()
        }
        .navigationTitle("")
    }
    
    func Courses(_ courses: [CourseFaq]) -> some View {
        VStack(spacing: 5){
            ForEach(courses.indices, id: \.self){ index in
                let item = courses[index]
                HStack(alignment: .top){
                    Text("Course: ")
                        .bold()
                        .opacity(index == 0 ? 1 : 0)
                    
                    Button{
                        
                    }label:{
                        Text(item.course)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
        }
    }
    
    func Label(_ label: String, text: String) -> some View {
        Text(label).bold() + Text(text)
    }
    
    func Topics(_ topics: [TopicFaq]) -> some View {
        HStack(alignment: .top){
            
            Text("Tópico: ")
                .bold()
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(topics.indices, id: \.self){ index in
                        let item = topics[index]
                        Button{
                            
                        }label:{
                            Text(item.topic)
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.leading)
                                .padding(5)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.gray)
                                )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        HelpDetailView(faq: Faq.sample[1])
    }
}
