//
//  CreateThreadViewModel.swift
//  ThreadsClone
//
//  Created by uExel on 30/07/2024.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let thread = Thread(ownerId: uid,
                            caption: caption,
                            timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
