//
//  ThreadService.swift
//  Thread
//
//  Created by 황성진 on 1/14/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThread() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timpstamp", descending: true).getDocuments()
        
        return snapshot.documents.compactMap{( try? $0.data(as: Thread.self) )}
    }
}
