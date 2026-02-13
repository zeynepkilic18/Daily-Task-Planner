//
//  User.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let joined: TimeInterval
}
