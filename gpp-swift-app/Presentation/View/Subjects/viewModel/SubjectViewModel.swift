//
//  SubjectViewModel.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 11/03/24.
//

import SwiftUI

extension InnerViewModel {
    
    var separetedUserList : [[Subject]]{
        let sorted = self.userSubjectsList.sorted(by: { $0.semester > $1.semester})
        
        var res = [[Subject]]()
        var temp = [Subject]()
        
        for subject in sorted {
            if let firstSubject = temp.first{
                let semester = firstSubject.semester
                let subjectSemester = subject.semester
                
                if semester > subjectSemester {
                    res.append(temp)
                    temp.removeAll()
                    temp.append(subject)
                }else{
                    temp.append(subject)
                }
            }else{
                temp.append(subject)
            }
        }
        
        res.append(temp)
        
        return res
    }
    
    func userSubjectListIsEmpty()->Bool{
        separetedUserList.first?.isEmpty ?? true
    }
    
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
            subjectsList.append(subject)
        }
    }
}
