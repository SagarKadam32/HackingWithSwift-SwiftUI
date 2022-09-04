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
    
    var body: some View {
        
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
