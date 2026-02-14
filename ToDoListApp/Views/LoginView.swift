//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
                VStack {
                    // Header
                    HeaderView(title: "To Do List",
                               subtitle: "Get things done!",
                               angle: 15,
                            backgroundColor: .brown)
                    
                  
                    Form {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage).foregroundColor(Color.red)
                        }
                        
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                        
                        TLButton(title: "Log In", background: .brown) {
                            viewModel.login()
                        }
                    }
                    .frame(height: 300) // 2. Form'a belirli bir alan tanı ki alt tarafı ezmesin
                    .offset(y: -50)
                    .scrollContentBackground(.hidden).background(Color.white)
                    
                    Spacer()
                    
                    // Create Account
                    VStack {
                        Text("New around here?")
                        NavigationLink("Create An Account", destination: RegisterView())
                    }
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
            }
        
    }
}

#Preview {
    LoginView()
}
