//
//  InnerViewModel.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 11/03/24.
//

import Foundation
import SwiftUI

class InnerViewModel : ObservableObject {
    @Published var profile = Profile(
        name: "Douglas Gomes",
        registerID: "123456789",
        entryDate: "01/01/2024",
        scholarShipStartDate: "01/01/2024",
        email: "douglasgommez@gmail.com",
        lattes: "www.douglas.lattes.com",
        title: "Projeto PPGCO",
        lineOfResearch: "Desenvolvimento Mobile",
        category: "Mestrado",
        advisor: "Rafael D. Araújo",
        advisorEmail: "rafaeldaraujo@gmail.com",
        coadvisor: "",
        startDate: "01/01/2024",
        endDate: "01/01/2026"
    )
    
    @Published var userPublicationsList : [Publication] = []
    
    @Published var userSubjectsList : [Subject] = []
    @Published var subjectsList : [Subject] = Subject.sampleList
    
    @Published var faqList : [Faq] = Faq.sample
    
    @Published var settingsToggle = false
    
}
