//
//  HabitItem.swift
//  iHabit
//
//  Created by Gorkem Turan on 28.12.2022.
//

import Foundation

struct HabitItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var amount: Int
    
    mutating func addAmount(newAmount: Int) {
        amount = amount + newAmount
    }
}
