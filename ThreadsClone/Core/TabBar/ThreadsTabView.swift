//
//  ThreadsTabView.swift
//  ThreadsClone
//
//  Created by uExel on 22/07/2024.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab = 0
    @State private var showCreateThreadView = false
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            FeedView().tabItem {
                Image(systemName: selectedTab == 0 ? "house.fill" : "house").environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
            }.onAppear {
              selectedTab = 0
            }.tag(0)
            ExploreView().tabItem {
                Image(systemName: "magnifyingglass")
            }.onAppear {
                selectedTab = 1
            }.tag(1)
           Text("").tabItem {
                Image(systemName: "plus")
            }.onAppear {
                selectedTab = 2
            }.tag(2)
            ActivityView().tabItem {
                Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
            }.onAppear {
                selectedTab = 3
            }.tag(3)
            CurrentUserProfileView().tabItem {
                Image(systemName: selectedTab == 4 ? "person.fill" : "person")
            }.onAppear {
                selectedTab = 4
            }.tag(4)
        }).onChange(of: selectedTab, perform: { newValue in
            showCreateThreadView = selectedTab == 2
        }).tint(.black)
            .sheet(isPresented: $showCreateThreadView, onDismiss: {
            selectedTab = 0
        }, content: {
            ThreadCreationView()
        })
        
    }
}

#Preview {
    ThreadsTabView()
}
