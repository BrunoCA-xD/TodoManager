//
//  TodoStorage.swift
//  HabitMaker-swiftUI
//
//  Created by Bruno Cardoso Ambrosio on 27/06/20.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoList: [TodoItem]
    
    init(todoList: [TodoItem] = []) {
        self.todoList = todoList
    }
}

let testStorage = TodoListViewModel(todoList: testData)
