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
    @Published var sideBar = false
    
    func navigate(to screen: any Screen) {
        path.append(screen)
        closeSideBar()
    }
    
    func openSideBar(){
        sideBar = true
    }
    
    func closeSideBar(){
        sideBar = false
    }
    
    func logout(){
        self.path = NavigationPath()
    }
}

enum LoginScreen : Screen {
    case home
    case signUp
    case forgotPassword
}

enum HomeScreen : Screen {
    case messages
    case subjects
    case publications
    case dissertation
    case goals
    case profile
    case changePassword
    case settings
    case help
}

protocol Screen : Hashable {}
