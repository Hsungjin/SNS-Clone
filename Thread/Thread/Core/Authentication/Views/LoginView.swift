//
//  LoginView.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct LoginView: View {
    // MARK: - PROPERTY
    @State private var email = ""
    @State private var password = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Image("thread-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("email 주소를 입력해주세요", text: $email)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())
                    
                    SecureField("비밀번호를 입력해주세요", text: $password)
                        .modifier(TextFieldModifier())
                }
                
                NavigationLink {
                    Text("비밀번호를 잊어버리셨나요")
                } label: {
                    Text("비밀번호를 잊어버리셨나요?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 20)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    
                } label: {
                    Text("로그인")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("계정이 없으신가요?")
                        
                        Text("회원가입 하러가기")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 24)
            } //: VSTACK
            
        }
    }
}

#Preview {
    LoginView()
}
