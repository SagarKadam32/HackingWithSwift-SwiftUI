//
//  ContentView.swift
//  WeSplit
//
//  Created by Sagar Kadam on 26/07/22.
//

import SwiftUI

struct ContentView: View {
    let students = ["Amar", "Akbar", "Anthony"]
    @State private var selectedStudent = "Amar"
    @State private var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        NavigationView{
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
                
                Section {
                    Button("Tap Count = \(tapCount)"){
                        tapCount += 1
                    }
                }

                Section {
                    TextField("Enter Your Name", text: $name)
                    Text("You Name is = \(name)")
                }
                
                Section {
                    Picker("Select Your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
 
            }
            .navigationTitle("Swift UI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
