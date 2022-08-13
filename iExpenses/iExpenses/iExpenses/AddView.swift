//
//  AddView.swift
//  iExpenses
//
//  Created by Sagar Kadam on 12/08/22.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var isSaveDisabled = true
    @State private var userCurrency = "USD" {
        didSet {
            amountCurrency = userCurrency
        }
    }
    @State private var amountCurrency : String = "USD"

    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    let currencyTypes = ["USD", "INR", "EUR","CAD","GBP"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Name" , text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                VStack(spacing: 20){
                    Picker("Select Currency", selection: $userCurrency) {
                        ForEach(currencyTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    HStack{
                        Text("Enter Amount")
                        Spacer()
                        TextField("Amount", value: $amount, format: .number)
                            .multilineTextAlignment(.trailing)
                            .background(.mint)
                            .keyboardType(.decimalPad)
                    }
                    
                    HStack {
                        Text("Amount")
                        Spacer()
                        Text(amount, format: .currency(code: getUserCurrencyCode()))
                            .foregroundColor(amount > 100 ? .red : (amount > 10 ? .blue : .green))
                            .font(amount > 100 ? .largeTitle : (amount > 10 ? .headline : .body))

                
                    }

                }.padding()
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currencyCode: userCurrency)
                    expenses.items.append(item)
                    dismiss()
                }
                .disabled(isSaveDisabled)
            }
            .onAppear {
                if(name.isEmpty) {
                    isSaveDisabled = true
                }else{
                    isSaveDisabled = false
                }
            }
        }
    }
    
    func getUserCurrencyCode() -> String {
        print("User Current =\(userCurrency)")
        return userCurrency
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
