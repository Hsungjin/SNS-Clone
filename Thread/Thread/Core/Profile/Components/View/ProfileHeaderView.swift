//
//  ProfileHeaderView.swift
//  Thread
//
//  Created by 황성진 on 1/14/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    // MARK: - PROPERT
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                // fullname and username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                    
                } //: VSTACK
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            } //: VSTACK
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        } //: HSTACK
    }
}


#Preview {
    ProfileHeaderView(user: DevPreviewProvider.shared.user)
}
