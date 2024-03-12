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
    
    
    
}
