//
//  LoginView.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var manager: AuthViewModel
    
    @FocusState var isFocused: Bool
    
    @State private var txtUsername = ""
    @State private var txtPassword = ""
    
    @State private var isLoadind = false
    @State private var goRegister = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack(alignment: .center) {
                
                Image("login-wallpaper")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(.black.opacity(0.88))
                
                VStack() {
                    
                    Spacer()
                    
                    Image(systemName: "shippingbox")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.mint)
                        .padding(.bottom, 20)
                    
                    Text("JDelivery")
                        .font(.system(size: 22, weight: .bold , design: .rounded))
                    
                    UIMyTextfField(value: $txtUsername, prompt: "Username", type: .emailAddress, capitalizacion: .never)
                        .focused($isFocused)
                    
                    UIMySecureField(value: $txtPassword, prompt: "Contraseña")
                    
                    VStack(spacing: 15) {
                        
                        UIMyButton(text: "Iniciar sesion") {
                            Task {
                                await manager.signIn(email: txtUsername, password: txtPassword)
                            }
                        }
                        
                        Text(manager.errorString ?? "")
                            .font(.caption)
                            .frame(width: 320, alignment: .center)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.yellow)
                    }
                    .padding(.vertical, 25)

                    Spacer()

                    Button("Unete a nosotros!") {
                        goRegister.toggle()
                    }
                    .foregroundStyle(.mint)
                    
                }
                .font(.custom("Poppins", size: 15))
            }
            .ignoresSafeArea(.keyboard)
            .fullScreenCover(isPresented: $goRegister) {
                RegisterView(manager: manager)
            }
        }
        .onAppear {
            isFocused = true
        }
    }
}

#Preview {
    LoginView(manager: AuthViewModel())
        .tint(.mint)
}
