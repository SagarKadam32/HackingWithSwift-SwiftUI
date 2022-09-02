//
//  ContentView.swift
//  Pre-BucketList
//
//  Created by Sagar Kadam on 31/08/22.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let values = [3,5,6,64,1,8,4].sorted()
    
    let users = [
        User(firstName: "James", lastName: "Bond"),
        User(firstName: "Ethan", lastName: "Hunt"),
        User(firstName: "Sagar", lastName: "Kadam"),
        User(firstName: "Tom", lastName: "Hanks")
    ].sorted()
      /*
        .sorted {
        $0.lastName < $1.lastName
    }*/
    
    var body: some View {
        VStack{
            
            /*
            List(values, id: \.self) {
                Text(String($0))
            }
            
            List(users) { user in
                Text("\(user.lastName), \(user.firstName)")
            } */
            
            Text("Hello World")
                .onTapGesture {
                    let str = "Test Message"
                    let url = getDocumentDirectory().appendingPathComponent("Message.txt")
                    
                    do {
                        try str.write(to: url, atomically: true, encoding: .utf8)
                        let input = try String(contentsOf: url)
                        print(input)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
