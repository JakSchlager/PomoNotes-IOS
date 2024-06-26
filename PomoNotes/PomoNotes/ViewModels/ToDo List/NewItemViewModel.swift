//
//  NewItemViewModel.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAllert = false
    
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get curr user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return 
        }
        
        // Create Model
        let newId = UUID().uuidString
        let newItem = TodoItemModel(id: newId,
                                    title: title,
                                    dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970,
                                    isDone: false)
        
        
        // Save Model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
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
