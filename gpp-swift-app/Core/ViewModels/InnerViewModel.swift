//
//  InnerViewModel.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 11/03/24.
//

import Foundation
import SwiftUI

class InnerViewModel : ObservableObject {
    @Published var userSubjectsList : [Subject] = []
    @Published var subjectsList : [Subject] = Subject.sampleList
    
    
    func addUserSubject(_ subject_: Subject){
        var subject = subject_
        subject.status = .MATRICULADO
        
        withAnimation {
            userSubjectsList.append(subject)
            subjectsList.removeAll(where: {
                $0.id == subject.id
            })
        }
    }
    
    func removeUserSubject(_ subject: Subject){
        withAnimation {
            userSubjectsList.removeAll(where: {
                $0.id == subject.id
            })
        }
    }
}
