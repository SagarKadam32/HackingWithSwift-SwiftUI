//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sagar Kadam on 30/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        ZStack{
            /*
            VStack(spacing:0){
                Color.red
                Color.blue
            }*/
           // AngularGradient(colors: [.red, .blue, .green, .yellow,.orange,.red], center: .center)
            VStack{
                /*
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
                 */
                
                VStack(spacing : 20) {
                    Button("Button 1"){}
                        .buttonStyle(.bordered)
                    Button("Button 2", role: .destructive){}
                        .buttonStyle(.bordered)
                    Button("Button 3"){}
                        .buttonStyle(.borderedProminent)
                    Button("Button 4", role: .destructive){}
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                    
                    Button {
                        print("Button was Tapped")
                    } label : {
                        Text("Tap Me")
                            .padding()
                            .foregroundColor(.white)
                            .background(.red)
                    }
                    
                    Button {
                        print("Edit button was tapped")
                    } label : {
                        Label("Edit", systemImage: "pencil")
                    }
                    
                    Button("Show Alert"){
                        showingAlert = true
                    }
                    .alert("Important Message", isPresented: $showingAlert) {
                        Button("Delete", role: .destructive){}
                        Button("Cancel", role: .cancel) {}
                    }message: {
                        Text("Please read this")
                    }
                    

                }
            }
            //.foregroundColor(.none)
               // .padding(50)
            .background(.clear)
            
        }.ignoresSafeArea()
        

     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
