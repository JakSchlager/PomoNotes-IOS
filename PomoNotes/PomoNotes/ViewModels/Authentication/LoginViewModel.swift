//
//  LoginViewModel.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMsg = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMsg = "Please fill out all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Please enter a valid email."
            return false
        }
        
        return true
    }
}
