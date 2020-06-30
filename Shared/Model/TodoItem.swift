//
//  TodoItem.swift
//  HabitMaker-swiftUI
//
//  Created by Bruno Cardoso Ambrosio on 27/06/20.
//

import Foundation

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
    var isDone: Bool
    
}

let testData = [
    TodoItem(title: "Get Children on school", isDone: false),
    TodoItem(title: "Code an app", isDone: false),
    TodoItem(title: "Walk the dog", isDone: false),
    TodoItem(title: "Read the emails", isDone: true),
    TodoItem(title: "Call some friend", isDone: false)
]
