//
//  Usercell.swift
//  Thread
//
//  Created by 황성진 on 1/10/24.
//

import SwiftUI

struct Usercell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            
            VStack(alignment: .leading) {
                Text("길동이")
                    .fontWeight(.semibold)
                
                Text("Cats")
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
    Usercell()
}
