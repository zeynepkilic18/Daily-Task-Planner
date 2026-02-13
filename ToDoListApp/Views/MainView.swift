//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 10.02.2026.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //signed in
            
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
