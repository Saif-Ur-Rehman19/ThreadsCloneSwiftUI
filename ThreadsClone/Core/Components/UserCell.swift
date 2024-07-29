//
//  UserCell.swift
//  ThreadsClone
//
//  Created by uExel on 23/07/2024.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username).font(.footnote).fontWeight(.semibold)
                Text(user.fullname).font(.footnote)
            }.font(.footnote)
            Spacer()
            Text("Follow").font(.subheadline).fontWeight(.semibold).frame(width: 100, height: 32).overlay {
                RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4), lineWidth: 1)
            }
        }
    }
}

#Preview {
    UserCell(user: User(id: "", fullname: "", email: "", username: "", profileImageUrl: "", bio: ""))
}
