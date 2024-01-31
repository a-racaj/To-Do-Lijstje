//
//  ListRowView.swift
//  SwiftUITodo
//
//  Created by A R on 11/10/23.
//

import SwiftUI

// Weergave voor een rij in de lijst met taken.
struct ListRowView: View {
    let todo: TodoModel // Het TodoModel-object dat deze rij vertegenwoordigt.
    
    var body: some View {
        HStack {
            Text(todo.title)
                .lineLimit(1) // Beperk het aantal regels voor de titel tot één.
            
            Spacer() // Voeg een flexibele ruimte toe om de tekst en het pictogram te scheiden.
            
            // Een afbeelding die een vinkje of een leeg vakje weergeeft op basis van de voltooiingsstatus van de taak.
            Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isCompleted ? .green : .red) // Groene kleur voor voltooide taken, rode kleur voor niet-voltooide taken.
        }
        .font(.title2) // Gebruik een bepaald lettertype voor de tekst.
        .padding(.vertical, 8) // Voeg verticale opvulling toe aan de rij voor visuele scheiding.
    }
}


