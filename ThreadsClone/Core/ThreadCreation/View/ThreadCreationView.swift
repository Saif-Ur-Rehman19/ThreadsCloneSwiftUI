//
//  ThreadCreationView.swift
//  ThreadsClone
//
//  Created by uExel on 23/07/2024.
//

import SwiftUI

struct ThreadCreationView: View {
    @State private var caption = ""
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user, size: .small)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.username ?? "").fontWeight(.semibold)
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }.font(.footnote)
                    Spacer()
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark").resizable().frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }.padding()
                .navigationTitle("New Thread").navigationBarTitleDisplayMode(.inline).toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }.font(.subheadline).foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        Task { try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    }.font(.subheadline).foregroundColor(.black).fontWeight(.semibold).opacity(caption.isEmpty ? 0.5 : 1.0).disabled(caption.isEmpty)
                }
            }
        }
    }
}

//#Preview {
//    ThreadCreationView()
//}
