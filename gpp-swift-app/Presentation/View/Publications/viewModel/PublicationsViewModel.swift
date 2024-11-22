//
//  PublicationsViewModel.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 21/11/24.
//
import SwiftUI

extension InnerViewModel {
    func addPublication(_ publication: Publication){
        self.userPublicationsList.append(publication)
    }
    
    func removePublication(_ publication: Publication){
        withAnimation{
            self.userPublicationsList.removeAll(where: { $0.id == publication.id })
        }
    }
}
