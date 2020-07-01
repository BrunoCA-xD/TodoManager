//
//  TodoListView.swift
//  iOS
//
//  Created by Bruno Cardoso Ambrosio on 30/06/20.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var todoListVM: TodoListViewModel
    @State var presentAddNewItem = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                List {
                    ForEach(todoListVM.todoCellViewModels) { item in
                        TodoCellView(todoModel: item)
                    }
                    .onMove(perform: moveTodos(from:to:))
                    .onDelete(perform: deleteTodos(offsets:))
                    if presentAddNewItem {
                        TodoCellView(todoModel: TodoCellViewModel(todo: TodoItem(title: "", isDone: false))) { todo in
                            todoListVM.addTodo(todo)
                            presentAddNewItem.toggle()
                        }
                    }
                    HStack {
                        Spacer()
                        Text("\(todoListVM.todoCellViewModels.count) To-do's")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                Button(action: {presentAddNewItem.toggle()}, label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                        Text("Add new to-do")
                    }
                })
                .padding(.leading)
            }
            .navigationTitle("To-do's")
            .navigationBarItems(trailing: HStack {
                #if os(iOS)
                #if DEBUG
                Button("Add mock", action: makeTodo)
                #endif
                EditButton()
                #endif
                
            })
        }
    }
    
    func makeTodo() {
        withAnimation {
            todoListVM.todoCellViewModels.append(TodoCellViewModel(todo: TodoItem(title: "New one", isDone: false)))
        }
    }
    func moveTodos(from: IndexSet, to: Int) {
        withAnimation {
            todoListVM.todoCellViewModels.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteTodos(offsets: IndexSet) {
        withAnimation {
            todoListVM.todoCellViewModels.remove(atOffsets: offsets)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoListVM: testStorage)
            .preferredColorScheme(.dark)
    }
}
