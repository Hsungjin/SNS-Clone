//
//  EditProfileView.swift
//  Thread
//
//  Created by 황성진 on 1/10/24.
//

import SwiftUI

struct EditProfileView: View {
    // MARK: - PROPERTY
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    // name and profile image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("길동이")
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    } //: HSTACK
                    
                    Divider()
                    
                    // bio field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio", text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link...", text: $link, axis: .vertical)
                    }

                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                    
                } //: VSTACK
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            } //: ZSTACK
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }

            }
        }
    }
}

#Preview {
    EditProfileView()
}
