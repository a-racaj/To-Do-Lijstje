//
//  TodoModel.swift
//  SwiftUITodo
//
//  Created by A R on 11/10/23.
//

import Foundation

// Een eenvoudige gegevensstructuur die een taakmodel vertegenwoordigt.
struct TodoModel: Identifiable, Codable {
    
    let id: String // Unieke identificatie voor de taak.
    let title: String // De titel van de taak.
    let isCompleted: Bool // Geeft aan of de taak is voltooid of niet.
    
    // Initialisatiemethode voor het maken van een nieuw taakobject.
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // Functie om de voltooiingsstatus van een taak bij te werken en een nieuw taakobject terug te geven.
    func updateCompletion() -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}


