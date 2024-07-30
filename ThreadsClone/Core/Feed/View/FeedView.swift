//
//  FeedView.swift
//  ThreadsClone
//
//  Created by uExel on 23/07/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) {
                        thread in
                        ThreadCell(thread: thread)
                    }
                }
            }.refreshable {
                Task { try await viewModel.fetchThreads() }
            }
            .navigationTitle("Threads").navigationBarTitleDisplayMode(.inline)
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "arrow.counterclockwise").foregroundColor(Color.black)
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
   
}
