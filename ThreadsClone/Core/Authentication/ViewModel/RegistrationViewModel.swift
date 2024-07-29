//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by uExel on 25/07/2024.
//

import Foundation


class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var userName = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName, username: userName)
    }
}
