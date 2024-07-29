//
//  CurrentUserProfileViewModel.swift
//  ThreadsClone
//
//  Created by uExel on 29/07/2024.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("\(user)")
        }.store(in: &cancellables)
    }
    
   
}
