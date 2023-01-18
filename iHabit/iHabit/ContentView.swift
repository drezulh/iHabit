//
//  ContentView.swift
//  iHabit
//
//  Created by Gorkem Turan on 28.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isStarted = false
    @StateObject var habits = Habits()
    
    var body: some View {
        if !isStarted {
            IntroView(isTapped: $isStarted)
        } else {
            MainView(habits: Habits())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
