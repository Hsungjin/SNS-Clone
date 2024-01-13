//
//  CureentUserProfileView.swift
//  Thread
//
//  Created by 황성진 on 1/14/24.
//

import SwiftUI

struct CureentUserProfileView: View {
    // MARK: - PROPERTY
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                // bio and state
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                    
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                    
                    // user content list view
                    UserContentView()

                } //: VSTACK
            } //: SCROLL
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .toolbar {
                ToolbarItem(placement:.topBarTrailing) {
                    Button {
                        AuthService.shared.singOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CureentUserProfileView()
}
