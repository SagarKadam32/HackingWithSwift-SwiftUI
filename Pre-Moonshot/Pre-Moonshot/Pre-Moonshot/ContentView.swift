//
//  ContentView.swift
//  Pre-Moonshot
//
//  Created by Sagar Kadam on 14/08/22.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText-\(text)")
        self.text = text
    }
}


struct ContentView: View {
    var body: some View {
        ScrollView(){
            LazyVStack(spacing: 10) {
                /*
                GeometryReader { geo in
                    Image("Swiss")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .frame(width: geo.size.width, height: geo.size.height
                        )
                }*/
                
                ForEach(0..<100) {
                    /*
                    Text("Item \($0)")
                        .font(.title)
                     */
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
