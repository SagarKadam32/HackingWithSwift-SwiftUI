//
//  ExpenseItem.swift
//  iExpenses
//
//  Created by Sagar Kadam on 12/08/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currencyCode : String
}
