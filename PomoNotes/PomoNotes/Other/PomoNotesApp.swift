//
//  PomoNotesApp.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import SwiftUI
import FirebaseCore

@main
struct PomoNotesApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
