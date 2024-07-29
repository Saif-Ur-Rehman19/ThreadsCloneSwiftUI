//
//  LoginView.swift
//  ThreadsClone
//
//  Created by uExel on 22/07/2024.
//

import SwiftUI

struct LoginView: View {
    @State var isPresented = false
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("threadLogo").resizable().scaledToFit().frame(width: 120, height:  120).padding()
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email).modifier(ThreadsTextfieldModifier()).autocapitalization(.none).frame(width: UIScreen.main.bounds.width - 30)
                    SecureField("Enter your password", text: $viewModel.password).modifier(ThreadsTextfieldModifier()).frame(width: UIScreen.main.bounds.width - 30)              }
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password").font(.footnote).fontWeight(.semibold).padding(.top).padding(.horizontal, 10).foregroundColor(.black).frame(maxWidth: .infinity, alignment: .trailing)
                }.padding(.bottom)
                if isPresented {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25).stroke(Color(.gray),lineWidth: 1).frame(width: 50, height: 50).foregroundColor(.white)
                        ProgressView()
                    }.padding(.bottom, 10)
                }
                    Button {
                        isPresented = true
                        Task {
                            try await viewModel.login()
                            isPresented = false
                        }
                    } label: {
                            Text("Login")
                                .font(.subheadline).fontWeight(.semibold).foregroundColor(.white).frame(width: 360, height: 44).background(.black).cornerRadius(8).padding(.horizontal, 20)
                        
                    }.disabled(isPresented == true)
                
                   
                    Spacer()
                    Divider()
                    NavigationLink {
                        RegistrationView().navigationBarBackButtonHidden(true)
                        
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                            Text("Sign Up").fontWeight(.semibold)
                        }.font(.footnote).foregroundColor(.black
                        )
                    }.padding(.vertical, 16)
                
                    
                }
            }
        }
    }
