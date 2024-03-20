//
//  NewItemView.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Note")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                
                // Button
                TLButton(title: "Save Note",
                         backgroundColor: .red) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAllert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAllert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select a due date that is today or newer."))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
    }))
}
