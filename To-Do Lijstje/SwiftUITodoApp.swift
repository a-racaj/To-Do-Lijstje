//
//  SwiftUITodoApp.swift
//  SwiftUITodo
//
//  Created by A R on 11/10/23.
//

import SwiftUI

// Hoofdapplicatiestructuur die voldoet aan het App-protocol.
@main
struct SwiftUITodoApp: App {
    
    // Een StateObject dat de TodoListViewModel beheert.
    @StateObject var todoListViewModel: TodoListViewModel = TodoListViewModel()
    
    // De hoofdstructuur van de app die het uiterlijk en gedrag definieert.
    var body: some Scene {
        // Definieer het hoofdvenster van de app.
        WindowGroup {
            // De hoofdnavigatieview van de app met TodoListView als de startweergave.
            NavigationView {
                TodoListView()
            }
            .environmentObject(todoListViewModel) // Voeg het TodoListViewModel toe als environment object voor gegevensdeling.
        }
    }
}


