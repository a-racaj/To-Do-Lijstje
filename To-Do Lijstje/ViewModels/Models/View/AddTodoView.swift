//
//  AddTodoView.swift
//  SwiftUITodo
//
//  Created by A R on 11/10/23.
//

import SwiftUI

// Weergave voor het toevoegen van een nieuwe taak.
struct AddTodoView: View {
    
    // Om de presentatiemodus te kunnen beheren.
    @Environment(\.presentationMode) var presentationMode
    
    // Het environment object waarmee toegang wordt verkregen tot de gedeelde TodoListViewModel.
    @EnvironmentObject var todoListViewModel: TodoListViewModel

    // Een State-eigenschap om de tekst van de nieuwe taak bij te houden.
    @State var text: String = ""
    
    var body: some View {
        
        VStack {
            // Tekstinvoerveld voor het toevoegen van de taak.
            TextField("Voeg hier je To-Do Toe!", text: $text, axis: .vertical)
                .frame(height: 55)
                .lineLimit(3...10) // Beperk het aantal regels voor de tekst.
                .padding(.horizontal)
            
            Spacer(minLength: 500) // Creëer een ruimte onder het tekstveld met een minimale hoogte van 500 punten.
            
            // Knop om de nieuwe taak op te slaan.
            Button(action: onSave, label: {
                Text("Sla Op")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor) // Accentkleur als achtergrond.
                    .cornerRadius(10) // Afgeronde hoeken.
            })
        }
        .padding(14) // Voeg algemene opvulling toe aan de hele weergave.
        .navigationTitle("To-Do Toevoegen ✏️") // Titel van de navigatiebalk.
    }
    
    // Functie om de nieuwe taak op te slaan.
    func onSave() {
        todoListViewModel.addTodo(title: text) // Voeg de nieuwe taak toe aan de lijst.
        presentationMode.wrappedValue.dismiss() // Sluit het scherm voor het toevoegen van taken.
    }
}

// Voorbeeldweergave voor de AddTodoView.
// Hier wordt een voorbeeld AddTodoView weergegeven in een NavigationView.
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTodoView()
        }
        .environmentObject(TodoListViewModel()) // Voeg een voorbeeld TodoListViewModel toe als environment object.
    }
}


