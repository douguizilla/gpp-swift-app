//
//  Coauthor.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 21/11/24.
//

import Foundation

struct Coauthor : Codable, Hashable {
    var id = UUID().uuidString
    var name = ""
    var lastName = ""
    var lattes = ""
    var affiliation = ""    
}
