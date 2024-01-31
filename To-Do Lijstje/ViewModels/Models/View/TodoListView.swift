//
//  TodoListView.swift
//  SwiftUITodo
//
//  Created by A R on 11/10/23.
//

import SwiftUI

// Een weergave die de lijst met taken weergeeft en interacties mogelijk maakt.
struct TodoListView: View {
    
    // Het environment object waarmee toegang wordt verkregen tot de gedeelde TodoListViewModel.
    @EnvironmentObject var todoListViewModel: TodoListViewModel
    
    // Een State-eigenschap om bij te houden of de lijst aan het bewerken is.
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            // Weergave voor het geval dat er geen taken zijn.
            if todoListViewModel.todos.isEmpty {
                NoItemView()
            } else {
                // Weergave van de lijst met taken.
                List {
                    ForEach(todoListViewModel.todos) { todo in
                        // Weergave van een rij in de lijst met interactie bij tikken.
                        ListRowView(todo: todo)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    todoListViewModel.updateTodo(todo: todo)
                                }
                            }
                    }
                    .onDelete(perform: todoListViewModel.deleteTodo) // Mogelijkheid om taken te verwijderen.
                    .onMove(perform: todoListViewModel.moveTodo) // Mogelijkheid om taken te verplaatsen.
                }
                .listStyle(PlainListStyle()) // Stel een eenvoudige lijststijl in.
            }
        }
        .navigationTitle("To-Do Lijst📍") // Titel van de navigatiebalk.
        .navigationBarItems(
            leading: Button(action: {
                isEditing.toggle() // Schakel tussen bewerken en gereed.
            }) {
                Text(isEditing ? "Gereed" : "Bewerken")
            },
            trailing: NavigationLink(
                "Toevoegen",
                destination: AddTodoView() // Navigatielink naar scherm voor het toevoegen van een nieuwe taak.
            )
        )
        .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive)) // Schakel de bewerkingsmodus in of uit.
    }
}

// Voorbeeldweergave voor de TodoListView.
// Hier wordt een voorbeeld TodoListView weergegeven in een NavigationView.
struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoListView()
        }
        .environmentObject(TodoListViewModel()) // Voeg een voorbeeld TodoListViewModel toe als environment object.
    }
}


