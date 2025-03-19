//
//  AuthService.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum AuthError: String, Error {
    case userNotCreated = "The new client could not be created."
    case userNotFound = "Verify the data entered."
    case ErrorSignOut = "Error signing out."
}

final class AuthService {
    
    private let auth = Auth.auth()
    private let store = Firestore.firestore()
    
    func getCurrentUser() throws -> Client? {
        
        let currentUser = auth.currentUser
        
        guard let realEmail = currentUser?.email else {
            return nil
        }
        
        let client = Client(email: realEmail, names: realEmail, deliveryList: [])
        return client
    }
    
    func signOut() throws {
        do {
            try auth.signOut()
        } catch {
            throw AuthError.ErrorSignOut
        }
    }
    
    func createUser(email: String, pass: String, name: String) async throws -> Client {
        
        do {
            var itemUser: User?
            
            do {itemUser = try await auth.createUser(withEmail: email, password: pass).user
            } catch { throw error }
            
            guard let realId = itemUser?.uid, let realEmail = itemUser?.email else {
                throw AuthError.userNotCreated
            }
            
            let newClient = Client(email: realEmail, names: name, deliveryList: [])
            try store.collection("clients").document(realId).setData(from: newClient)
            
            return newClient
            
        } catch {
            throw error
        }
    }
    
    func signIn(email: String, pass: String) async throws -> Client {
        
        do {
            let itemUser = try await auth.signIn(withEmail: email, password: pass).user
            
            guard let realEmail = itemUser.email else {
                throw AuthError.userNotFound
            }
            
            let client = Client(email: realEmail, names: realEmail, deliveryList: [])
            return client
            
        } catch {
            throw error
        }
    }
    
}
