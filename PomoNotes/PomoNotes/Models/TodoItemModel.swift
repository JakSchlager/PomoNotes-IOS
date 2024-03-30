//
//  TodoItemModel.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import Foundation

struct TodoItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
