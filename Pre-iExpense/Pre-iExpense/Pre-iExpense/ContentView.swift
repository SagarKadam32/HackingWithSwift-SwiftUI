//
//  ContentView.swift
//  Pre-iExpense
//
//  Created by Sagar Kadam on 11/08/22.
//

import SwiftUI


class User : ObservableObject{
    @Published var firstName = "Sagar"
    @Published var lastName = "Kadam"
}

struct ContentView: View {
    @StateObject var user = User()
    
    var body: some View {
        
        
        VStack {
            Text("User name is \(user.firstName) \(user.lastName)")
            
            HStack {
                Text("First Name:")
                TextField("First Name", text: $user.firstName)
            }
            HStack {
                Text("Last Name:")
                TextField("Last Name", text: $user.lastName)
            }
            
            Spacer()

        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
