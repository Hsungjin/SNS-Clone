//
//  AuthService.swift
//  Thread
//
//  Created by 황성진 on 1/11/24.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            print("DEBUG: Login user \(result.user.uid)")
            print(result.user)
        } catch {
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, password: password, fullname: fullname, username: username, id: result.user.uid)
            print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func singOut() {
        try? Auth.auth().signOut() // sings out on backend
        self.userSession = nil // this removes session locally and updates routing
        UserService.shared.reset() // sets current user objet to nil
    }
    
    
    // 파이어베이스에 유저 정보를 업로드
    @MainActor
    private func uploadUserData(withEmail email: String,
                                password: String,
                                fullname: String,
                                username: String,
                                id: String
    ) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
