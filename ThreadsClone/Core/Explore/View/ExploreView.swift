//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by uExel on 23/07/2024.
//

import SwiftUI

struct ExploreView: View {
    @State var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) {
                        user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                Divider()
                            }.padding(.vertical, 4)
                        }
                        
                    }
                }.padding()
            }.navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            }).navigationTitle("Search").searchable(text:  $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
