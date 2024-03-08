//
//  NavigationManager.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import Foundation
import SwiftUI

class NavigationManager : ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to screen: any Screen) {
        path.append(screen)
    }
}

enum LoginScreen : Screen {
    case home
    case signUp
    case forgotPassword
}

enum HomeScreen : Screen {
    case subjects
    case publications
}

protocol Screen : Hashable {}
