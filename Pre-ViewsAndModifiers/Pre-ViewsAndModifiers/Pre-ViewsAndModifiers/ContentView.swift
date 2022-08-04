//
//  ContentView.swift
//  Pre-ViewsAndModifiers
//
//  Created by Sagar Kadam on 03/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showRedContent = false
    
    let motto1 = Text("This is views")
    let motto2 = Text("been used as properties")
    
    @ViewBuilder var myOwnView : some View {
        Text("My View")
            .font(.largeTitle)
        Button("Click Me"){
        }
    }
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
                Text("Mumbai")
                    .font(.largeTitle)
                   // .blur(radius: 50)
                Text("Pune")
                Text("Delhi")
                Text("Cheenai")
            }.font(.title)
            // .blur(radius: 5)
            
            Button("Show Color Change") {
                showRedContent.toggle()
            }.foregroundColor(showRedContent ? .red : .blue)
            
            VStack{
                motto1
                    .font(.largeTitle)
                motto2
                    .font(.title)
            }
            
            myOwnView
        }



        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
