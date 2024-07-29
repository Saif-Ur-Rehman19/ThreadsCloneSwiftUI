//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by uExel on 29/07/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User?
    init(user: User?) {
        self.user = user
    }
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "").font(.title2).fontWeight(.semibold)
                    Text(user?.username ?? "").font(.subheadline)
                }
                if let bio = user?.bio {
                    Text(bio).font(.footnote)
                }
               
                Text("2 followers").font(.caption).foregroundColor(.gray)
            }
            Spacer()
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

//#Preview {
//    ProfileHeaderView(user: dev)
//}
