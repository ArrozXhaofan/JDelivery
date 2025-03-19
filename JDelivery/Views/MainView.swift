//
//  ContentView.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 15/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authManager: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Hola \(authManager.clientSignIn?.names ?? "No data")")
            
            Button {
                authManager.signOut()
            } label: {
                Image(systemName: "power")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.yellow)
                    .shadow(color: .white, radius: 5)
            }
            
            
        }
        .padding()
    }
}

#Preview {
        let testVM = AuthViewModel()
        ContentView()
            .environmentObject(testVM)
}
