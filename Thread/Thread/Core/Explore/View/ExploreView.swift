//
//  ExploreView.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct ExploreView: View {
    // MARK: - PROPERTY
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                Usercell(user: user)
                                
                                Divider()
                            } //: VSTACK
                            .padding(.vertical, 4)
                        }
                    }
                }
            } //: SCROLL
            .navigationDestination(for: User.self, destination: { user in
                ProfileView()
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        } //: NAVIGATION
    }
}

#Preview {
    ExploreView()
}
