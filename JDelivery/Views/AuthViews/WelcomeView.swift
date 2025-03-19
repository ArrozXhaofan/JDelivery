//
//  WelcomeView.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import SwiftUI

struct WelcomeView: View {
    
    @ObservedObject var manager: AuthViewModel
    
    var body: some View {
        
        ZStack {
            
            Image("register-wallpaper")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(.black.opacity(0.88))
            
            VStack {
                
                Spacer()
                
                VStack {
                    Text("Listo")
                        .font(.custom("PlaywriteHU-Regular", size: 35))
                        .frame(width: 250)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.red)
                    
                    Text("Haz tus primeros pedidos")
                        .font(.custom("PlaywriteHU-Regular", size: 17))
                        .frame(width: 250)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                Button {
                    manager.openMain = true
                } label: {
                    VStack {
                        Text("Empezar")
                            .font(.custom("PlaywriteHU-Regular", size: 17))
                            .padding()
                            .foregroundStyle(.white)
                    }
                    .frame(width: 180, height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundStyle(.red)
                    }
                }
                
            }
        }
    }
}

#Preview {
    WelcomeView(manager: AuthViewModel())
}
