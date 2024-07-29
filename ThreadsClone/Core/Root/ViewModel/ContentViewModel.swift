//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by uExel on 25/07/2024.
//

import Foundation
import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpSubscribers()
    }
    
    private func setUpSubscribers() {
        AuthService.shared.$userSession.sink { [weak self]
            userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
