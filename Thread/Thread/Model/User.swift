//
//  User.swift
//  Thread
//
//  Created by 황성진 on 1/12/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
