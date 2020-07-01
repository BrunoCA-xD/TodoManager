//
//  TodoCellView.swift
//  HabitMaker-swiftUI
//
//  Created by Bruno Cardoso Ambrosio on 29/06/20.
//

import SwiftUI

struct TodoCellView: View {
    @ObservedObject var todoModel: TodoCellViewModel
    
    var onCommit: (TodoItem) -> (Void) = {_ in }
    var body: some View {
        HStack{
            Image(systemName: todoModel.completionStateIconName)
                .onTapGesture {
                    self.todoModel.todo.isDone.toggle()
                }
            TextField("Title", text: $todoModel.todo.title, onCommit: {
                self.onCommit(self.todoModel.todo)
            })
        }
    }
}
    
    struct TodoCellView_Previews: PreviewProvider {
        static var previews: some View {
            TodoCellView(todoModel: TodoCellViewModel(todo: TodoItem(title: "Todo Item", isDone: true)))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
