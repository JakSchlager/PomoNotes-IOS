//
//  ProfileView.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                }
                else {
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        // Info: Name, Email, ...
        VStack(alignment: .leading) {
            HStack {
                Text("First name: ")
                    .bold()
                Text(user.firstName)
            }
            .padding()
            
            HStack {
                Text("Last name: ")
                    .bold()
                Text(user.lastName)
            }
            .padding()
            
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        // Sign out
        Button("Log Out") {
            viewModel.logout()
        }
        .foregroundColor(.red)
        Spacer()
    }
}

#Preview {
    ProfileView()
}
