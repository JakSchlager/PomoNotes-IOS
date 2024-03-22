//
//  ToDoListViewModel.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import Foundation

// ViewModel for List of Items
// Primary Tab
class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    init() {}
}
