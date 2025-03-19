//
//  RegisterView.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var manager: AuthViewModel
    
    @FocusState var isFocused: Bool
    @State private var txtUsername = ""
    @State private var txtPassword = ""
    @State private var txtRepeatPasword = ""
    @State private var txtName = ""
    
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 15) {
                
                Text("Unete a Nosotros!")
                    .font(.custom("PlaywriteHU-Regular", size: 20))
                    .frame(width: 320, alignment: .leading)
                    .padding(.top, 20)
                
                UIMyTextfField(value: $txtUsername,
                               prompt: "Correo electronico",
                               type: .emailAddress, capitalizacion: .never)
                .focused($isFocused)
                
                UIMySecureField(value: $txtPassword, prompt: "Contraseña")
                UIMySecureField(value: $txtRepeatPasword, prompt: "Repetir contraseña")
                UIMyTextfField(value: $txtName,
                               prompt: "Nombres",
                               capitalizacion: TextInputAutocapitalization.words)
                
                HStack {
                    Spacer()
                    UIMyButton(text: "Listo", width: 110) {
                        Task {
                            await manager.register(email: txtUsername,
                                                   password: txtPassword,
                                                   name: txtName,
                                                   repeatPassword: txtRepeatPasword)
                        }
                    }
                }
                .frame(width: 320)
                Spacer()
                
                Button{
                    dismiss()
                } label: {
                    Text("Ya tengo una cuenta")
                        .foregroundColor(.yellow)
                }
            }
            .frame(maxWidth: .infinity)
            .background {
                Color.black.opacity(0.85)
                    .ignoresSafeArea()
                    .background {
                        Image("register-wallpaper")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                    }
            }
            .onChange(of: manager.errorRegisterString, { oldValue, newValue in
                if newValue != nil {
                    showAlert = true
                }
            })
            .fullScreenCover(isPresented: $manager.isDone) {
                WelcomeView(manager: manager)
            }
            .alert("Error al registrarse", isPresented: $showAlert) {
                Button("Aceptar", role: .cancel) {
                    manager.errorRegisterString = nil
                    isFocused = true
                }
                .foregroundStyle(.yellow)
            } message: {
                Text(manager.errorRegisterString ?? "")
            }
        }
        
    }
}

#Preview {
    RegisterView(manager: AuthViewModel())
        .font(.custom("Poppins", size: 15))
        .tint(.mint)
}
