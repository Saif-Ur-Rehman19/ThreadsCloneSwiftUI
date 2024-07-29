//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by uExel on 22/07/2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer(minLength: 100)
            
            Image("threadLogo").resizable().scaledToFit().frame(width: 120, height:  120).padding()
            VStack {
                
                TextField("Enter your email", text: $viewModel.email).modifier(ThreadsTextfieldModifier()).autocapitalization(.none).frame(width: UIScreen.main.bounds.width - 30)
                SecureField("Enter your password", text: $viewModel.password).modifier(ThreadsTextfieldModifier()).frame(width: UIScreen.main.bounds.width - 30)
                TextField("Enter your full name", text: $viewModel.fullName).modifier(ThreadsTextfieldModifier()).frame(width: UIScreen.main.bounds.width - 30)
                TextField("Enter your username", text: $viewModel.userName).modifier(ThreadsTextfieldModifier()).frame(width: UIScreen.main.bounds.width - 30)
                Button {
                    Task {
                        try await viewModel.createUser()
                    }
                } label: {
                    Text("Sign Up")
                        .font(.subheadline).fontWeight(.semibold).foregroundColor(.white).frame(width: 360, height: 44).background(.black).cornerRadius(8).padding(.horizontal, 20)
                }.padding(.vertical)
                
                Spacer()
                Divider()
                Button(action: {
                  dismiss()
                }, label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Sign In").fontWeight(.semibold)
                    }.font(.footnote).foregroundColor(.black
                    )
                }).padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
