//
//  ContentView.swift
//  Instagram
//
//  Created by 황성진 on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @State private var mail = ""
    @State private var password = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            FormField(value: $mail, icon: "mail", placeholder: "E-mail")
            
            FormField(value: $password, icon: "lock", placeholder: password, isSecure: true)
        }
    }
}

#Preview {
    ContentView()
}
