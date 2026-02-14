//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemIsPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item").font(.system(size: 32)).bold().padding(.top, 10)
            Form {
                //Title
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save", background: .brown, action: {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemIsPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }).padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text ("Error"), message: Text("Please fill in all fields and select due date that is in the today.")
            )}
        }
    }
}

#Preview {
    NewItemView(newItemIsPresented: Binding(get: {
        return true
    }, set: { _ in }
    ))
}
