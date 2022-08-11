//
//  ContentView.swift
//  Pre-iExpense
//
//  Created by Sagar Kadam on 11/08/22.
//

import SwiftUI

struct SecondView: View {
    var name: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Hello \(name)")
            
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

class User : ObservableObject{
    @Published var firstName = "Sagar"
    @Published var lastName = "Kadam"
}

struct ContentView: View {
    @StateObject var user = User()
    @State private var showingSheet = false
    
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
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }.sheet(isPresented: $showingSheet) {
                SecondView(name: " \(user.firstName) \(user.lastName)")
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
