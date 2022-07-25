//
//  ContentView.swift
//  WeSplit
//
//  Created by Sagar Kadam on 26/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, world 1")
                Text("Hello, world 2")
                Text("Hello, world 3")
                Text("Hello, world 4")
                Text("Hello, world 5")
            }
            
            Section {
                Text("Hello, world 6")
                Text("Hello, world 7")
                Text("Hello, world 8")
                Text("Hello, world 9")
                Text("Hello, world 10")
                Text("Hello, world 11")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
