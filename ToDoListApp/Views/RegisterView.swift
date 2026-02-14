//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register", subtitle: "Star organizing todos ", angle: -15, backgroundColor: .brown)
            
            Form {
                TextField("Full Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(.none).autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .brown, action: {
                    viewModel.register()
                
                })
                .padding()
            }
            .offset(y: -50)
            .scrollContentBackground(.hidden).background(Color.white)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
