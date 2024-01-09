//
//  CircularProfileImageView.swift
//  Thread
//
//  Created by 황성진 on 1/10/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    var body: some View {
        Image("cat")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
