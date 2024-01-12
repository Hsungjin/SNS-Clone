//
//  ProfileView.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - PROPERTY
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @StateObject var viewModel = ProfileViewModel()
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                // bio and state
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            // fullname and username
                            VStack(alignment: .leading, spacing: 4) {
                                Text(viewModel.currentUser?.id ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("길동이")
                                    .font(.subheadline)
                                
                            } //: VSTACK
                            
                            Text("냐아아옹")
                                .font(.footnote)
                            
                            Text("2 followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        } //: VSTACK
                        Spacer()
                        
                        CircularProfileImageView()
                    } //: HSTACK
                    
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    // user content list view
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundStyle(.black)
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "itme", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundStyle(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                } //: VSTACK
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                }
                            } //: LOOP
                        } //: HSTACK
                        LazyVStack {
                            ForEach(0 ... 10, id: \.self) { thread in
                                ThreadCell()
                            }
                        } //: LAZYVSTACK
                        .padding(.vertical, 8)
                    } //: VSTACK

                } //: VSTACK
            } //: SCROLL
            .toolbar {
                ToolbarItem(placement:.topBarTrailing) {
                    Button {
                        AuthService.shared.singOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .padding(.horizontal)
        } //: NAVI
    }
}

#Preview {
    ProfileView()
}
