//
//  CreateThreadView.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct CreateThreadView: View {
    // MARK: - PROPERTY
    @Environment(\.dismiss) var dismiss
    @State private var caption = ""
    @StateObject var viewModel = CreateThreadViewModel()
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user, size: .small)
                    
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("길동이")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    } //: VSTACK
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        }
                    }
                    
                } //: HSTACK
                
                Spacer()
            } //: VSTACK
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    } label: {
                        Text("Post")
                            .opacity(caption.isEmpty ? 0.5 : 1)
                            .disabled(caption.isEmpty)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
            }
        } //: NAVIGATION
    }
}

#Preview {
    CreateThreadView()
}
