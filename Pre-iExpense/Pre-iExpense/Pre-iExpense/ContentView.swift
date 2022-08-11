//
//  ContentView.swift
//  Pre-iExpense
//
//  Created by Sagar Kadam on 11/08/22.
//

import SwiftUI


struct User {
    var firstName = "Sagar"
    var lastName = "Kadam"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        
        
        VStack {
            Text("User name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
