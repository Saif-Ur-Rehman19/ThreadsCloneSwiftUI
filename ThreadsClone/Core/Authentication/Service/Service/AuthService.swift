//
//  AuthService.swift
//  ThreadsClone
//
//  Created by uExel on 25/07/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            print("Signed in successfully")
        } catch {
            print("Debug failed to signin ")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String,
                    username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email,
                                                          password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullName, username: username, id: result.user.uid)
            
        } catch {
            print("Debug err failed to create account \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // signout form backend
        self.userSession = nil // removes session locally and updates routing
        UserService.shared.reset()
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String, fullname: String, username: String, id: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username, profileImageUrl: "", bio: "")
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
        
    }
    
}
