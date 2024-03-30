//
//  LoginView.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "PomoNotes", subtitle: "Better focus on your Tasks", angle: 15, backgroundColor: .blue)
                
                
                // Login Form
                Form {
                    if !viewModel.errorMsg.isEmpty {
                        Text(viewModel.errorMsg)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TLButton(title: "Login", backgroundColor: .blue) {
                        // Atempt log in
                        viewModel.login()
                    }
                }
                .offset(y: -100)
                                
                // Create Account
                VStack {
                    Text("Don't have an Account yet?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
            }
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
