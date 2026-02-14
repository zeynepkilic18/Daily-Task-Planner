//
//  Untitled.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
import Combine

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init () {
        
    }
    
    func save () {
        guard canSave else {
            return
        }
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970,isDone: false)
        
        // Save model
        let db = Firestore.firestore()
        if let data = newItem.asDictionary() {
            db.collection("users").document(uId).collection("todos").document(newId).setData(data)
        }
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
