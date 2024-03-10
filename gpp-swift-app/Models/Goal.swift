//
//  Goal.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 10/03/24.
//

import Foundation

struct Goal : Codable, Identifiable {
    var id: String = UUID().uuidString
    
    var title: String
    var numberSEI : String
    var date : String
    var hasMandatoryDoc : Bool
    var description: String
    var collegiateMeeting: String
    var credits: String
    var status: String
    
    static let sample = Goal(
        title: "Projeto",
        numberSEI: "123456789",
        date: "25/01/2025",
        hasMandatoryDoc: true,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        collegiateMeeting: "-",
        credits: "5",
        status: "não iniciado"
    )
}
