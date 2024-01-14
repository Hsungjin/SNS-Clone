//
//  UserContentView.swift
//  Thread
//
//  Created by 황성진 on 1/14/24.
//

import SwiftUI

struct UserContentView: View {
    // MARK: - PROPERTY
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    // MARK: - BODY
    var body: some View {
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
//                    ThreadCell()
                }
            } //: LAZYVSTACK
            .padding(.vertical, 8)
        } //: VSTACK
        

    }
}

#Preview {
    UserContentView()
}
