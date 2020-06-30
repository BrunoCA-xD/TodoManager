//
//  TodoListView.swift
//  iOS
//
//  Created by Bruno Cardoso Ambrosio on 30/06/20.
//

import SwiftUI

struct TodoList: View {
    @ObservedObject var store: TodoListViewModel
    
    var body: some View {
        NavigationView{
            List {
                ForEach(store.todoList) { item in
                    TodoCellView(todoItem: item)
                }
                .onMove(perform: moveTodos(from:to:))
                .onDelete(perform: deleteTodos(offsets:))
                HStack {
                    Spacer()
                    Text("\(store.todoList.count) To-do's")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
            }
            .navigationTitle("To-do's")
            .navigationBarItems(leading: HStack {
                NavigationLink(
                    destination: AddTodoView(),
                    label: {
                        Text("+")
                            .font(.largeTitle)
                    })

            }, trailing: HStack {
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
            store.todoList.append(TodoItem(title: "New one", isDone: false))
        }
    }
    func moveTodos(from: IndexSet, to: Int) {
        withAnimation {
            store.todoList.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteTodos(offsets: IndexSet) {
        withAnimation {
            store.todoList.remove(atOffsets: offsets)
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList(store: testStorage)
        .preferredColorScheme(.dark)
    }
}
