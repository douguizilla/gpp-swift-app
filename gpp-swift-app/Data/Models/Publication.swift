//
//  Publication.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 21/11/24.
//

import Foundation

struct Publication: Codable, Hashable {
    
    var id: String = UUID().uuidString
    var title: String = ""
    var vehicleName: String = ""
    var url: String = ""
    var coauthors : [Coauthor] = []
    
}

