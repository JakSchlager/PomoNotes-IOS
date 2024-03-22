//
//  ToDoListView.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To-Do List")
            .toolbar {
                Button {
                    // action
                    viewModel.showingNewItemView = true
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
