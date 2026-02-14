//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
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
