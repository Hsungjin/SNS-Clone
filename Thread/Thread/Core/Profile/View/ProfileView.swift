//
//  ProfileView.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - PROPERTY
    let user: User
    
    // MARK: - BODY
    var body: some View {
        ScrollView(showsIndicators: false) {
            // bio and state
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)

                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                // user content list view
                UserContentView()
                
            } //: VSTACK
        } //: SCROLL
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView(user: DevPreviewProvider.shared.user)
}
