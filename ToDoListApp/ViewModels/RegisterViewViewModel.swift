//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation
import Combine

class RegisterViewViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
        
    init() {
    }
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [ weak self]
            result, error in guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,  email: email,name: name, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        if let data = newUser.asDictionary() {
                db.collection("users")
                    .document(id)
                    .setData(data)
            }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
