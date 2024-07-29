//
//  ContentView.swift
//  ThreadsClone
//
//  Created by uExel on 22/07/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabView()
            } else {
                LoginView()
            }
        }
       
    }
}

#Preview {
    ContentView()
}
