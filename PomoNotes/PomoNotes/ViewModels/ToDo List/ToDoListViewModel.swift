//
//  ToDoListViewModel.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import Foundation
import FirebaseFirestore

// ViewModel for List of Items
// Primary Tab
class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    // Delete ToDo List item
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
