//
//  AuthViewModel.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import SwiftUI

final class AuthViewModel: ObservableObject {
    
    @Published var clientSignIn: Client?
    @Published var errorString: String?
    @Published var errorRegisterString: String?
    
    @Published var isDone: Bool = false
    @Published var openMain: Bool = false
    
    private var authService: AuthService
    
    init(clientSignIn: Client? = nil,
         authService: AuthService = .init()) {
        self.clientSignIn = clientSignIn
        self.authService = authService
        
        getCurrentUser()
    }
    
    func signOut() {
        do {
            try authService.signOut()
            getCurrentUser()
        } catch let authError as AuthError {
            errorString = authError.rawValue
            print(authError.localizedDescription)
        } catch {
            errorString = error.localizedDescription
            print("Erros inesperado: \(error)")
        }
    }
    
    func getCurrentUser()  {
        do {
            clientSignIn = try authService.getCurrentUser()
            
            if clientSignIn != nil {
                openMain = true
            }
            
        } catch let authError as AuthError {
            errorString = authError.rawValue
            print(authError.localizedDescription)
        } catch {
            errorString = error.localizedDescription
            print("Erros inesperado: \(error)")
        }
        
    }
    
    func register(email: String, password: String, name: String, repeatPassword: String) async {
        
        if password != repeatPassword {
            errorString = "Passwords do not match"
            return
        }
        
        do {
            clientSignIn = try await authService.createUser(email: email, pass: password, name: name)
            
            if clientSignIn != nil {
                isDone = true
            }
            
        } catch let authError as AuthError {
            errorRegisterString = authError.rawValue
            print(authError.localizedDescription)
        } catch {
            errorRegisterString = error.localizedDescription
            print("Erros inesperado: \(error)")
        }
    }
    
    func signIn(email: String, password: String) async {
        
        do {
            clientSignIn = try await authService.signIn(email: email, pass: password)
            
            if clientSignIn != nil {
                openMain = true
            }
            
        } catch let authError as AuthError {
            print(authError.localizedDescription)
            
            withAnimation(.easeInOut(duration: 0.3)) {
                errorString = authError.rawValue
            }
            
        } catch {
            print("Erros inesperado: \(error)")

            withAnimation(.easeInOut(duration: 0.3)) {
                errorString = error.localizedDescription
            }
        }
    }
    
    
    
}
