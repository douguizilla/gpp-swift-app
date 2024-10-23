//
//  SubjectStatus.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 11/03/24.
//

import SwiftUI

enum SubjectStatus : CaseIterable, Codable {
    case MATRICULADO
    case NAO_MATRICULADO
    case NOTA_A
    case NOTA_B
    case NOTA_C
    case NOTA_D
    case NOTA_E
    
    var display : String {
        switch self {
        case .MATRICULADO:
            "MATRICULADO"
        case .NAO_MATRICULADO:
            "NÃO MATRICULADO"
        case .NOTA_A:
            "NOTA A"
        case .NOTA_B:
            "NOTA B"
        case .NOTA_C:
            "NOTA C"
        case .NOTA_D:
            "NOTA D"
        case .NOTA_E:
            "NOTA E"
        }
    }
    
    var color : Color {
        switch self {
        case .MATRICULADO:
                return .blue
        case .NAO_MATRICULADO:
            return Color(.systemGray)
        case .NOTA_A, .NOTA_B, .NOTA_C:
            return .green
        case .NOTA_D, .NOTA_E:
            return .red
        }
    }
}
