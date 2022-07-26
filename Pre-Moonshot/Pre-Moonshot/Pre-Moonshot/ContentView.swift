//
//  ContentView.swift
//  Pre-Moonshot
//
//  Created by Sagar Kadam on 14/08/22.
//

import SwiftUI


struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

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
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    let layoutAdaptive = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        
        /*
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
        } */
        
        /*
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }.navigationTitle("Swift UI")
        }*/
        
        /*
        VStack {
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Sagar Kadam",
                    "address": {
                        "street": "Tejpal Scheme Road No-2",
                        "city": "Mumbai"
                    }
                }
                """
                
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                if let user = try? decoder.decode(User.self, from: data){
                    print(user.address.street)
                }
            }
        } */
        
        
        ScrollView {
            
            /*
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }*/
            
            
            LazyVGrid(columns: layoutAdaptive) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
