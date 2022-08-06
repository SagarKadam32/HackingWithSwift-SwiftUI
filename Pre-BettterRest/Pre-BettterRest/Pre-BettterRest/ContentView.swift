//
//  ContentView.swift
//  Pre-BettterRest
//
//  Created by Sagar Kadam on 06/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUP = Date.now
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        
        VStack{
            Stepper("\(sleepAmount.formatted()) Hours", value: $sleepAmount, in: 4...12, step: 0.15)
                
            DatePicker("Please Enter a date", selection: $wakeUP)
            
            DatePicker("",selection: $wakeUP)
            DatePicker("",selection: $wakeUP)
                .labelsHidden()
            
            DatePicker("Please enter a time",selection: $wakeUP, displayedComponents: .hourAndMinute)
            
            DatePicker("Please enter a date",selection: $wakeUP, displayedComponents: .date)
            
            DatePicker("Please enter a date",selection: $wakeUP, in: Date.now...)
            
            DatePicker(
                  "Start Date",
                   selection: $wakeUP,
                   in: dateRange,
                   displayedComponents: [.date, .hourAndMinute]
              )
        }.padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
