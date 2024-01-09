//
//  FeedView.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct FeedView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { thread in
                        ThreadCell()
                    }
                }
            } // SCROLL
            .refreshable {
                print("DEBUG: Refresh threads")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        } //: NAVIGATION
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
