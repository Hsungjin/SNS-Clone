//
//  UserService.swift
//  Thread
//
//  Created by 황성진 on 1/12/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
//        print("DEBUG: User is \(user)")
    }
    
    // 자신을 제외한 다른 유저 정보를 가져오기
    static func fetchUser() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap{( try? $0.data(as: User.self) )}
        return users.filter({$0.id != currentUid})
    }
    
    func reset() {
        self.currentUser = nil
    }
}
