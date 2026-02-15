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
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    ProgressView("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
            .background(Color(.systemGroupedBackground)) 
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        ScrollView {
            VStack(spacing: 20) {
                // Avatar
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.brown)
                    .frame(width: 120, height: 120)
                    .shadow(radius: 5)
                    .padding(.top, 40)
                
                // Info
                VStack(spacing: 0) {
                    infoRow(label: "Name", value: user.name)
                    Divider().padding(.leading)
                    infoRow(label: "Email", value: user.email)
                    Divider().padding(.leading)
                    infoRow(label: "Member Since", value: "\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
                }
                .background(Color(.secondarySystemGroupedBackground))                 .cornerRadius(12)
                .padding()

                // Log Out
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Log Out")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.brown)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
        }
    }
    

    @ViewBuilder
    func infoRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .bold()
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .foregroundColor(.primary)
        }
        .padding()
        .frame(height: 50)
    }
}

#Preview {
    ProfileView()
}
