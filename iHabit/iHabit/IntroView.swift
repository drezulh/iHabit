//
//  Intro.swift
//  iHabit
//
//  Created by Gorkem Turan on 28.12.2022.
//

import SwiftUI

struct IntroView: View {
    @Binding var isTapped: Bool
    @State private var hasTimeElapsed = false
    var body: some View {
        ZStack {
            Image("Intro")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("iHabit App")
                    .padding(4)
                    .font(Font.largeTitle)
                    .background(.clear)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -300)
                
                Text(!hasTimeElapsed ? "" : "Tap anywhere to continue")
                    .task(delayText)
                    .padding(4)
                    .font(Font.title)
                    .background(.clear)
                    .foregroundColor(.white)
                    .offset(x: 0, y: 300)
                    .animation(.easeInOut.speed(0.7))
            }

        }
        .onTapGesture() {
            isTapped = true
        }
    }
    private func delayText() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            hasTimeElapsed = true
        }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(isTapped: .constant(false))
    }
}
