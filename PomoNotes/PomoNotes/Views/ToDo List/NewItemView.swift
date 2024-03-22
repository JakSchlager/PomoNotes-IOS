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
            HStack {
                Spacer()
                Text("New Item")
                    .font(.system(size: 32))
                    .bold()
                    .padding(.top, 20)
                    .offset(x: 25)
                
                Spacer()
                
                Button {
                    newItemPresented = false
                } label: {
                    Image(systemName: "xmark")
                }
                .padding()
                .offset(x: -15, y: 8)

                
            }
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                
                // Button
                TLButton(title: "Save Item",
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
