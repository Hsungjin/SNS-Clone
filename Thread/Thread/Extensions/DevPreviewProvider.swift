//
//  PreviewProvider.swift
//  Thread
//
//  Created by 황성진 on 1/14/24.
//

import SwiftUI

class DevPreviewProvider {
    static let shared = DevPreviewProvider()
    
    let user = User(id: NSUUID().uuidString, fullname: "MAXXX", email: "max@gmail.com", username: "MAxxxxx")
}
