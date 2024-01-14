//
//  CreateThreadViewModel.swift
//  Thread
//
//  Created by 황성진 on 1/14/24.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject {
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(ownerUid: uid, caption: caption, timpstamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
