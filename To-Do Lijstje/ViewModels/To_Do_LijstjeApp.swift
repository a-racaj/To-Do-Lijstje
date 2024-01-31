//
//  TodoListViewModel.swift
//  SwiftUITodo
//
//  Created by A R on 11/10/23.
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    // De gepubliceerde variabele die de lijst met taken bevat.
    @Published var todos: [TodoModel] = [] {
        didSet {
            saveTodo() // Wanneer de lijst met taken wordt bijgewerkt, sla de wijzigingen op.
        }
    }
    
    // Sleutel waarmee de lijst met taken in UserDefaults wordt opgeslagen.
    let itemKey: String = "item_list"
    
    // Initialisatiemethode voor de ViewModel.
    init() {
        getTodo() // Haal de opgeslagen taken op bij het maken van een instantie.
    }
    
    // Functie om opgeslagen taken op te halen uit UserDefaults.
    func getTodo() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedTodo = try? JSONDecoder().decode([TodoModel].self, from: data)
        else { return }
        
        self.todos = savedTodo // Wijs de opgehaalde taken toe aan de todos variabele.
    }
    
    // Functie om een taak te verwijderen op basis van het opgegeven IndexSet.
    func deleteTodo(indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
    }
    
    // Functie om een taak te verplaatsen binnen de lijst.
    func moveTodo(from: IndexSet, to: Int) {
        todos.move(fromOffsets: from, toOffset: to)
    }
    
    // Functie om een nieuwe taak toe te voegen aan de lijst.
    func addTodo(title: String) {
        let newTodo = TodoModel(title: title, isCompleted: false)
        todos.append(newTodo)
    }
    
    // Functie om een bestaande taak bij te werken.
    func updateTodo(todo: TodoModel) {
        if let index = todos.firstIndex(where: { $0.id == todo.id}) {
            todos[index] = todo.updateCompletion()
        }
    }
    
    // Functie om de huidige lijst met taken op te slaan in UserDefaults.
    func saveTodo() {
        if let encodedData = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}


