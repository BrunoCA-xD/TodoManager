//
//  TodoManagerApp.swift
//  Shared
//
//  Created by Bruno Cardoso Ambrosio on 30/06/20.
//

import SwiftUI

@main
struct TodoManagerApp: App {
    var body: some Scene {
        WindowGroup {
            TodoList(todoListVM: TodoListViewModel())
        }
    }
}
