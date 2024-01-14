//
//  PreviewProvider.swift
//  Thread
//
//  Created by 황성진 on 1/14/24.
//

import SwiftUI
import Firebase

class DevPreviewProvider {
    static let shared = DevPreviewProvider()
    
    let user = User(id: NSUUID().uuidString, fullname: "MAXXX", email: "max@gmail.com", username: "MAxxxxx")
    
    let thread = Thread(ownerUid: "123", caption: "test thread", timpstamp: Timestamp(), likes: 0)
}
