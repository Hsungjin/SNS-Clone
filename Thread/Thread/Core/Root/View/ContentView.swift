//
//  ContentView.swift
//  Thread
//
//  Created by 황성진 on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @StateObject var viewModel = ContentViewModel()
    
    // MARK: - BODY
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
