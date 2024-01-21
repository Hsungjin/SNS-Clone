//
//  FontField.swift
//  Instagram
//
//  Created by 황성진 on 1/21/24.
//

import SwiftUI

struct FormField: View {
    @Binding var value: String
    var icon: String
    var placeholder: String
    var isSecure = false
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: icon)
                    .padding()
                
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    } else {
                        TextField(placeholder, text: $value)
                    }
                }
                .font(.system(size: 20, design: .monospaced))
                .foregroundStyle(.black)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.none)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 4)
            )
            .padding()
        }
    }
}

//#Preview {
//    FontField()
//}
