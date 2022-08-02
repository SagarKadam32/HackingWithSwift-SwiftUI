//
//  ContentView.swift
//  Pre-ViewsAndModifiers
//
//  Created by Sagar Kadam on 03/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showRedContent = false
    var body: some View {
        VStack(spacing: 10) {
            Button("Tap Me") {
                print(type(of: self.body))
            }
            .background(.red)
            .foregroundColor(.white)
            .frame(width: 200, height: 100)
            .background(.blue)
            
            Text("Color me")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            
            VStack{
                Text("1")
                Text("2")
            }
            
            Button("Show Color Change") {
                showRedContent.toggle()
            }.foregroundColor(showRedContent ? .red : .blue)
            
        }



        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
