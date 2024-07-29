//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by uExel on 26/07/2024.
//

import Foundation


class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fethUsers() }
    }
    
    @MainActor
    private func fethUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
