//
//  FeedView.swift
//  ThreadsClone
//
//  Created by uExel on 23/07/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0...10, id: \.self) {
                        thread in
                        ThreadCell()
                    }
                }
            }.refreshable {
                
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
