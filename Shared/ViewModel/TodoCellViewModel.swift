//
//  TodoCellViewModel.swift
//  HabitMaker-swiftUI
//
//  Created by Bruno Cardoso Ambrosio on 29/06/20.
//

import Foundation
import Combine

class TodoCellViewModel: ObservableObject, Identifiable {
    @Published var todo: TodoItem
    
    var id: String = ""
    @Published var completionStateIconName = ""
    
    var cancellables = Set<AnyCancellable>()
    
    init(todo: TodoItem) {
        self.todo = todo
        $todo
            .map { todo in
                todo.isDone ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        
        $todo
            .map { todo in
                todo.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    
}
