//
//  RegistrationView.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - PROPERTY
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.dismiss) var dismiss
    
    // MARK: - BODY
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("thread-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("email 주소를 입력해주세요", text: $email)
                    .modifier(TextFieldModifier())
                
                SecureField("비밀번호를 입력해주세요", text: $password)
                    .modifier(TextFieldModifier())
                
                TextField("이름을 입력해주세요", text: $fullname)
                    .modifier(TextFieldModifier())
                
                TextField("닉네임을 입력해주세요", text: $username)
                    .modifier(TextFieldModifier())
            }
            
            Button {
                
            } label: {
                Text("회왼가입")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("계정이 이미 있으신가요?")
                    
                    Text("로그인 하러가기")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical, 24)
        }
    } //: VSTACK
}

#Preview {
    RegistrationView()
}
