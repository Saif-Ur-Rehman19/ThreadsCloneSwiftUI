//
//  User.swift
//  ThreadsClone
//
//  Created by uExel on 25/07/2024.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    let bio: String?
}
