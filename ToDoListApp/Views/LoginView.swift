//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView()
                //Login Form
                Form {
                    TextField("Email Address", text: $email).textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password:", text: $password).textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        //Attempt log in
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Log In").foregroundColor(Color.white).bold()
                                
                        }
                    }.padding()
                }
                
                //Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Creat An Account", destination: RegisterView())
                        
                    }.padding(.bottom, 50)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
