//
//  Expenses.swift
//  iExpenses
//
//  Created by Sagar Kadam on 12/08/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
