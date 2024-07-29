//
//  ThreadCreationView.swift
//  ThreadsClone
//
//  Created by uExel on 23/07/2024.
//

import SwiftUI

struct ThreadCreationView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: nil, size: .small)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Max").fontWeight(.semibold)
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
                        
                    }.font(.subheadline).foregroundColor(.black).fontWeight(.semibold).opacity(caption.isEmpty ? 0.5 : 1.0).disabled(caption.isEmpty)
                }
            }
        }
    }
}

#Preview {
    ThreadCreationView()
}
