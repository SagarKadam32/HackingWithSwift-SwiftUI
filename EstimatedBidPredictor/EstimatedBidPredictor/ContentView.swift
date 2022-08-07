//
//  ContentView.swift
//  EstimatedBidPredictor
//
//  Created by Sagar Kadam on 06/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Form {
                
                Section {
                    Text("$200")
                } header: {
                    Text("Predicted Bid Value for Car")
                }
            }.navigationTitle("Estimated Bid Predictor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
