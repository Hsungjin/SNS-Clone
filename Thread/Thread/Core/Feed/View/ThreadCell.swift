//
//  ThreadCell.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct ThreadCell: View {
    // MARK: - PROPERTY
    let thread: Thread
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10분전")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    } //: HSTACK
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                }
            } //: HSTACK
            
            Divider()
        } //: VSTACK
        .padding()
    }
}

#Preview {
    ThreadCell(thread: DevPreviewProvider.shared.thread)
}
