//
//  SignUpView.swift
//  Instagram
//
//  Created by 황성진 on 1/22/24.
//

import SwiftUI

struct SignUpView: View {
    // MARK: - PROPERTY
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        
        profileImage = inputImage
    }

    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "camera")
                    .font(.system(size: 60, weight: .black, design: .monospaced))
                
                VStack(alignment: .leading) {
                    Text("Welcome Back")
                        .font(.system(size: 32, weight: .heavy))
                    
                    Text("Signin To Continue")
                        .font(.system(size: 16, weight: .medium))
                }
                
                VStack {
                    Group {
                        if profileImage != nil {
                            profileImage!
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 200, height: 200)
                                .padding(.top, 20)
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                        }
                    }
                }
                
                
                Group {
                    FormField(value: $username, icon: "person.fill", placeholder: "Username")
                    
                    FormField(value: $email, icon: "envelope.fill", placeholder: "E-mail")
                    
                    FormField(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)
                }
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .font(.title)
                        .modifier(ButtonModifiers())
                }
            } //: VSTACK
            .padding()
        } //: SCROLL
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text(""), buttons: [.default(Text("Choose A Photo")) {
                self.sourceType = .photoLibrary
                self.showingImagePicker = true
            },
                                                   .default(Text("Take A Photo")) {
                                                       self.sourceType = .camera
                                                       self.showingImagePicker = true
                                                   }, .cancel()
                                                  ])
        }
    }
}

#Preview {
    SignUpView()
}
