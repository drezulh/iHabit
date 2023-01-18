//
//  MainView.swift
//  iHabit
//
//  Created by Gorkem Turan on 28.12.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var habits : Habits
    @State private var showingAddHabits = false
    
    
    var body: some View {
        NavigationView {
            List {
                //                Section {
                ForEach(habits.items){ item in
                    NavigationLink {
                        DetailView(habit: item, habits: habits)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.description)
                            }
                            Spacer()
                            Text("\(item.amount)")
                        }
                    }
                }
                .onDelete(perform: removeItems)
                //                }
            }
            .navigationBarTitle("My Habits")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddHabits = true
            }, label: {
                Image(systemName: "plus")
            }))
                .sheet(isPresented: $showingAddHabits) {
                    AddHabitView(habits: habits)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(habits: Habits())
    }
}
