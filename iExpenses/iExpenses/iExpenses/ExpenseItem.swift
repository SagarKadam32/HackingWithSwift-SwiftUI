//
//  ExpenseItem.swift
//  iExpenses
//
//  Created by Sagar Kadam on 12/08/22.
//

import Foundation

struct ExpenseItem {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
