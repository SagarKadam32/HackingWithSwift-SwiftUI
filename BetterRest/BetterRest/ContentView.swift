//
//  ContentView.swift
//  BetterRest
//
//  Created by Sagar Kadam on 06/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                HStack(alignment: .center) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) Hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                HStack(alignment: .center){
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper(coffeeAmount == 1 ? "1 cup": "\(coffeeAmount) cups",value: $coffeeAmount, in: 1...20)
                }
            }
            .padding()
            .navigationTitle("BetterRest")
            .toolbar{
                    Button("Calculate", action: calculateBedTime)
            }
        }
    }
    
    func calculateBedTime() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
