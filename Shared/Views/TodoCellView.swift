//
//  TodoCellView.swift
//  HabitMaker-swiftUI
//
//  Created by Bruno Cardoso Ambrosio on 29/06/20.
//

import SwiftUI

struct TodoCellView: View {
    var todoItem: TodoItem
    var body: some View {
        NavigationLink(destination: Text("Destination")) {
            HStack{
                Text(todoItem.title)
                Spacer()
                if todoItem.isDone {
                    Image(systemName: "checkmark.circle")
                }
            }
        }
    }
}

struct TodoCellView_Previews: PreviewProvider {
    static var previews: some View {
        TodoCellView(todoItem: TodoItem(title: "Todo Item", isDone: true))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
