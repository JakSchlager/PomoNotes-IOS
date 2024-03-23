//
//  UserModel.swift
//  PomoNotes
//
//  Created by Jakob on 17.03.24.
//

import Foundation

struct User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let joined: TimeInterval
}
