//
//  ProfileViewModel.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TodoItemModel) {
        var coppiedItem = item
        coppiedItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(coppiedItem.id)
            .setData(coppiedItem.asDictionary())
        
    }
}
