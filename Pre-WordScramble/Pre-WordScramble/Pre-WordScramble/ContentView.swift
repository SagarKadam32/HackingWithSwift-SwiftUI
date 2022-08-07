//
//  ContentView.swift
//  Pre-WordScramble
//
//  Created by Sagar Kadam on 07/08/22.
//

import SwiftUI

struct ContentView: View {
    let people = ["Amar", "Akbar", "Anthony"]
    
    var body: some View {
            VStack(spacing: 0){
                
                List {
                    Text("A")
                    Text("B")
                    Text("C")
                }
                
                List {
                    Section("Section-0") {
                        Text("Static Text-1")
                    }
                    Section("Section-1") {
                        ForEach(0..<2){
                            Text("Dynamic Row \($0)")
                        }
                    }
                    Section("Section-2") {
                        Text("Static Text-2")
                    }
                }.listStyle(.grouped)
                
                List {
                    Text("Static Row-1")
                    
                    ForEach(people, id: \.self){
                        Text($0)
                    }
                }.listStyle(.grouped)
            }
        //}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
