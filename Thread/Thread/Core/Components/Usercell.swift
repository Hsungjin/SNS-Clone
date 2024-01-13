//
//  Usercell.swift
//  Thread
//
//  Created by 황성진 on 1/10/24.
//

import SwiftUI

struct Usercell: View {
    // MARK: - PROPERTY
    let user: User
    
    // MARK: - BODY
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
            } //: VSTACK
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        } //: HSTACK
        .padding(.horizontal)
    }
}

#Preview {
    Usercell(user: DevPreviewProvider.shared.user)
}
