//
//  AuthService.swift
//  Thread
//
//  Created by 황성진 on 1/11/24.
//

import Firebase


class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail eamil: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: eamil, password: password)
            self.userSession = result.user
            print("DEBUG: Login user \(result.user.uid)")
            print(result.user)
        } catch {
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail eamil: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: eamil, password: password)
            self.userSession = result.user
            print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func singOut() {
        try? Auth.auth().signOut() // sings out on backend
        self.userSession = nil // this removes session locally and updates routing
    }
}
