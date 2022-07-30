//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sagar Kadam on 30/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            /*
            VStack(spacing:0){
                Color.red
                Color.blue
            }*/
            AngularGradient(colors: [.red, .blue, .green, .yellow,.orange,.red], center: .center)
            VStack{
                HStack {
                    Text("1")
                    Text("2")
                    Text("3")
                }
                HStack {
                    Text("4")
                    Text("5")
                    Text("6")
                }
                HStack {
                    Text("7")
                    Text("8")
                    Text("9")
                }
            }.foregroundColor(.black)
                .padding(50)
                .background(.ultraThinMaterial)
            
        }.ignoresSafeArea()
        

     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
