//
//  ThreadCell.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct ThreadCell: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Image("cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("길동이")
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
                    
                    Text("야옹 야옹!")
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
    ThreadCell()
}
