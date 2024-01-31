//
//  NoItemView.swift
//  SwiftUITodo
//
//  Created by A R on 11/10/23.
//

import SwiftUI

// Weergave voor het geval dat er geen taken zijn om weer te geven.
struct NoItemView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                // Tekst die wordt weergegeven wanneer er geen taken zijn.
                Text("Er zijn geen To-Do's 😢")
                    .font(.title) // Gebruik een bepaald lettertype voor de titel.
                    .fontWeight(.semibold) // Maak de tekst vet.
                
                // Aanvullende uitleg over hoe je een taak kunt toevoegen.
                Text("Klik op de knop rechtsboven 'Toevoegen' om je To-Do toe te voegen")
            }
            .multilineTextAlignment(.center) // Centreer de tekst in meerdere regels.
            .padding(40) // Voeg opvulling toe rond de hele stapel.
        }
    }
}

// Voorbeeldweergave voor de NoItemView.
// Hier wordt een voorbeeld NoItemView weergegeven in een NavigationView.
struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("Title") // Titel van de navigatiebalk (kan worden aangepast aan de context).
        }
    }
}


