//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by uExel on 23/07/2024.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: nil, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("max").font(.footnote).fontWeight(.semibold)
                        Spacer()
                        Text("10m").font(.caption).foregroundColor(Color(.systemGray3))
                        Button(action: {}, label: {
                            Image(systemName: "ellipsis").foregroundColor(Color(.darkGray))
                        })
                    }
                    Text("Formula1 champion").font(.footnote).multilineTextAlignment(.leading)
                    HStack(spacing: 16) {
                        Button(action: {}, label: {
                            Image(systemName: "heart")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "bubble.right")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "paperplane")
                        })
                    }.padding(.vertical, 8).foregroundColor(Color(.black))
                }
            }
            Divider()
        }.padding()
    }
}

#Preview {
    ThreadCell()
}
