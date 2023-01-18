//
//  DetailView.swift
//  iHabit
//
//  Created by Gorkem Turan on 28.12.2022.
//

import SwiftUI

struct DetailView: View {
    @State var amount = 0
    
    @State var habit: HabitItem
    @ObservedObject var habits: Habits
    
    var body: some View {
        
        Form {
            Section(header: Text("\(habit.name)")) {
                Text("\(habit.description)")
            }
            
            Section(header: Text("Change Completed Times")) {
                Stepper(value: $amount, in: 0...Int.max, step: 1) {
                    Text("Completed times: \(amount)")
                }
            }
        }
        .navigationBarTitle(Text("\(habit.name)"))
        .toolbar {
            ToolbarItem() {
                Button("Save") {
                    saveHabit()
                }
            }
        }
        .onAppear {
            amount = habit.amount
        }
    }
    func saveHabit () {
        //Find the first index of habits class that contains selected habitItem
        if let index = habits.items.firstIndex(of: habit) {
            //copy selected HabitItem to temporary constant
            let tempHabit = HabitItem(name: habit.name, description: habit.description, amount: amount)
            //change the habits class item at index of selected habitItem and replace it with tempHabit
            habits.items[index] = tempHabit
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(amount: 0, habit: HabitItem(name: "Water", description: "Drinking Water", amount: 3), habits: Habits())
    }
}
