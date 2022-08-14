//
//  ContentView.swift
//  Pre-Moonshot
//
//  Created by Sagar Kadam on 14/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("Swiss")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .frame(width: geo.size.width, height: geo.size.height
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
