//
//  TodoStorage.swift
//  HabitMaker-swiftUI
//
//  Created by Bruno Cardoso Ambrosio on 27/06/20.
//

import Foundation
import Combine

class TodoListViewModel: ObservableObject {
    @Published var todoCellViewModels =  [TodoCellViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    
    func addTodo(_ todo: TodoItem) {
        todoCellViewModels.append(TodoCellViewModel(todo: todo))
    }
}

let testStorage: TodoListViewModel = {
    let test = TodoListViewModel()
    test.todoCellViewModels = testData.map({ todo in
        TodoCellViewModel(todo: todo)
    })
    return test
}()
