//
//  Threads.swift
//  ThreadsClone
//
//  Created by uExel on 30/07/2024.
//
import Firebase
import Foundation
import FirebaseFirestoreSwift


struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    
    let ownerId: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    var user: User?
}
