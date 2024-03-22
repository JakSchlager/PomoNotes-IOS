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
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
