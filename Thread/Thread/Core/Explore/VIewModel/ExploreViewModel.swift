//
//  ExploreViewModel.swift
//  Thread
//
//  Created by 황성진 on 1/14/24.
//

import Foundation

// ExploreViewModel
// users에 fetchUser 함수를 통해 UserService.fechUser(자신을 제외한 다른 유저 정보를 가져오기) 실행시킴

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fectchUser()
        }
    }
    
    @MainActor
    private func fectchUser() async throws {
        self.users = try await UserService.fetchUser()
    }
}
