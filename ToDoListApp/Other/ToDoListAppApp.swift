//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 10.02.2026.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
