//
//  ContentView.swift
//  BetterRest
//
//  Created by Sagar Kadam on 06/08/22.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var idealBedTime = ""
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime : Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("When do you want to wake up?")
                            .font(.headline)
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .onChange(of: wakeUp) { newValue in
                                calculateBedTime()
                            }
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Desired amount of sleep")
                            .font(.headline)
                        
                        Stepper("\(sleepAmount.formatted()) Hours", value: $sleepAmount, in: 4...12, step: 0.25)
                            .onChange(of: sleepAmount) { newValue in
                                calculateBedTime()
                            }
                    }
                   
                    VStack(alignment: .leading, spacing: 5){
                            Text("Daily coffee intake")
                                .font(.headline)
                            /*
                            Stepper(coffeeAmount == 1 ? "1 cup": "\(coffeeAmount) cups",value: $coffeeAmount, in: 1...20)
                             */
                        
                            Picker("Number of Cups", selection: $coffeeAmount) {
                                ForEach(1..<21){
                                    Text("\($0)")
                                }
                            }
                            .onChange(of: coffeeAmount) { newValue in
                                calculateBedTime()
                            }
                        }
                
                    Section(){
                        Text("\(idealBedTime)")
                            .font(.largeTitle)
                            .onAppear(){
                                calculateBedTime()
                            }
                           
                    }header: {
                        Text("Your IDEAL BED TIME")
                            .font(.headline)
                    }
                    }
                    .padding()
                    .navigationTitle("BetterRest")
                    /*
                    .toolbar{
                            Button("Find Ideal BedTime ?", action: calculateBedTime)
                    }
                    .alert(alertTitle, isPresented: $showingAlert) {
                        Button("OK") {}
                    }message: {
                        Text(alertMessage)
                    }
                     */
            }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)

            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            //alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            idealBedTime = sleepTime.formatted(date: .omitted, time: .shortened)
        }catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was as problem calculating your bedtime."
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
