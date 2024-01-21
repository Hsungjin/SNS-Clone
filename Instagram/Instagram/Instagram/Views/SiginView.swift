//
//  SiginView.swift
//  Instagram
//
//  Created by 황성진 on 1/21/24.
//

import SwiftUI

struct SiginView: View {
    // MARK: - PROPERTY
    @State private var email: String = ""
    @State private var password: String = ""
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "camera")
                .font(.system(size: 60, weight: .black, design: .monospaced))
            
            VStack(alignment: .leading) {
                Text("Welcome Back")
                    .font(.system(size: 32, weight: .heavy))
                
                Text("Signin To Continue")
                    .font(.system(size: 16, weight: .medium))
            }
            
            FormField(value: $email, icon: "envelope.fill", placeholder: "E-mail")
            
            FormField(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)
            
            Button {
                
            } label: {
                Text("Sign In")
                    .font(.title)
                    .modifier(ButtonModifiers())
            }
            
            HStack {
                Text("New?")
                Text("Create an Acouunt.")
                    .font(.system(size: 20, weight: .semibold))
            }
            
        } //: VSTACK
        .padding()
    }
}

#Preview {
    SiginView()
}
