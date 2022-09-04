//
//  ContentView.swift
//  Pre-HotProspects
//
//  Created by Sagar Kadam on 04/09/22.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Sagar Kadam"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    @StateObject private var user = User()
    @State private var selectedTab = "One"
    
    var body: some View {
        /* Reading custom values from the environment with @EnvironmentObject */
        /*
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
        .padding()
         */
        
        /* Creating tabs with TabView and tabItem() */
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .tabItem{
                    Label("One", systemImage: "star")
                }
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tag("One")
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .onTapGesture {
                    selectedTab = "One"
                }
                .tag("Two")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
