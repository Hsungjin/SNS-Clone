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
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { user in
                        VStack {
                            Usercell()
                            
                            Divider()
                        } //: VSTACK
                        .padding(.vertical, 4)
                    }
                }
            } //: SCROLL
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        } //: NAVIGATION
    }
}

#Preview {
    ExploreView()
}
