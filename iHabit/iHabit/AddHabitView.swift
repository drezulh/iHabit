//
//  AddHabitView.swift
//  iHabit
//
//  Created by Gorkem Turan on 28.12.2022.
//

import SwiftUI

struct AddHabitView: View {
    
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var amount = 0
    var body: some View {
        NavigationView {
            Form {
                    Section(header: Text("Name of habit")) {
                        TextField("Name", text: $name)
                    }
                    
                    Section(header: Text("Description of habit")) {
                        TextField("Descriptions", text: $description)
                    }
                    
                    Section(header: Text("Times completed")) {
                        Stepper(value: $amount, in: 0...Int.max, step: 1) {
                            Text("\(amount) times")
                        }
                    }
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let item = HabitItem(name: name, description: description, amount: amount)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
