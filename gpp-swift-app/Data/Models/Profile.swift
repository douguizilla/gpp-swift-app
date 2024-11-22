//
//  Profile.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 21/11/24.
//

import Foundation

struct Profile: Codable {
    var name: String = ""
    var registerID: String = ""
    var entryDate: String = ""
    var scholarShipStartDate: String = ""
    var email : String = ""
    var lattes : String = ""
    
    var title: String = ""
    var lineOfResearch: String = ""
    var category: String = ""
    var advisor: String = ""
    var advisorEmail: String = ""
    var coadvisor: String = ""
    var startDate: String = ""
    var endDate: String = ""
    
    var firstName : String {
        String(name.split(separator: " ").first?.capitalized ?? "")
    }
}
