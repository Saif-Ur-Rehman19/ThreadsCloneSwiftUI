//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by uExel on 29/07/2024.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var currentUser: User? {
        return viewModel.currentUser
    }
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) {
                    filter in VStack {
                        Text(filter.title).font(.subheadline).fontWeight(selectedFilter == filter ? .semibold : .regular)
                        if selectedFilter == filter {
                            Rectangle().matchedGeometryEffect(id: "item", in: animation).foregroundColor(.black).frame(width: filterBarWidth, height: 1)
                        } else {
                            Rectangle().foregroundColor(.clear).frame(width: filterBarWidth, height: 1)
                        }
                    }.onTapGesture {
                        withAnimation(.spring) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            LazyVStack {
                ForEach(0...10, id: \.self) { thread in
                    ThreadCell()
                }
            }
        }.padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView()
}
