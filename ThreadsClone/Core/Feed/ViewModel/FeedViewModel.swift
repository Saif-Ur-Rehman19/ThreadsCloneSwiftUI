//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by uExel on 30/07/2024.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    
    @Published var threads = [Thread]()
    
    init(){
        Task { try await fetchThreads() }
    }
    
   
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0..<threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerId
            let threadUser = try await UserService
                .fetchUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
    }
}
