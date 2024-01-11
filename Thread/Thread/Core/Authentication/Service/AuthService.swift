//
//  AuthService.swift
//  Thread
//
//  Created by 황성진 on 1/11/24.
//

import Firebase


class AuthService {
    
    static let shared = AuthService()
    
    @MainActor
    func login(withEmail eamil: String, password: String) async throws {
        
    }
    
    @MainActor
    func createUser(withEmail eamil: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: eamil, password: password)
            print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
}
