//
//  ContentView.swift
//  iExpenses
//
//  Created by Sagar Kadam on 12/08/22.
//

import SwiftUI

struct ExpenseView: View {
    var expenseItem : ExpenseItem
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(expenseItem.name)
                    .font(.headline)
                Text(expenseItem.type)
            }
            Spacer()
            Text(expenseItem.amount, format: .currency(code:expenseItem.currencyCode))
        }
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(expenses.items, id: \.id) { item in
                        if(item.type == "Personal") {
                            ExpenseView(expenseItem: item)
                        }
                   }
                    .onDelete(perform: removeItems)
                }
                
                Section("Business") {
                    ForEach(expenses.items, id: \.id) { item in
                        if(item.type == "Business") {
                            ExpenseView(expenseItem: item)
                         }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
