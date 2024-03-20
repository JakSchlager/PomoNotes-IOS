//
//  RegisterView.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Register",
                           subtitle: "Start focus know!",
                           angle: 15,
                           backgroundColor: .orange)
                .offset(y: -25)
                
                
                // Register Form
                Form {
                    TextField("First Name", text: $viewModel.firstName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Last Name", text: $viewModel.lastName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Create", backgroundColor: .orange) {
                        viewModel.register()
                    }
                    .padding()
                }
                .offset(y: -140)
                
                Spacer()
            }
        }
    }
}


#Preview {
    RegisterView()
}
