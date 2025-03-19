//
//  JDeliveryApp.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 15/03/25.
//

import SwiftUI

@main
struct JDeliveryApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authDelegate = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authDelegate.clientSignIn == nil {
                LoginView(manager: authDelegate)
            } else {
                ContentView()
                    .environmentObject(authDelegate)
            }
        }
    }
}


