//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import FirebaseFirestore
import Foundation
import Combine

/// ViewModel for list of items view
/// Primary lab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// Parameter id : item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
