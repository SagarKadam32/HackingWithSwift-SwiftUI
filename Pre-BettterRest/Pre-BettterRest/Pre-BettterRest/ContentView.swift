//
//  ContentView.swift
//  Pre-BettterRest
//
//  Created by Sagar Kadam on 06/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    var body: some View {
        Stepper("\(sleepAmount.formatted()) Hours", value: $sleepAmount, in: 4...12, step: 0.15)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
