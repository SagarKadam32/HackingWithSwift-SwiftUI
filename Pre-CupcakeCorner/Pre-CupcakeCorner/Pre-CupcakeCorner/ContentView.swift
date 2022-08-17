//
//  ContentView.swift
//  Pre-CupcakeCorner
//
//  Created by Sagar Kadam on 17/08/22.
//

import SwiftUI

class User: ObservableObject, Codable {
    @Published var name = "Sagar Kadam"
    
    enum CodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct ContentView: View {
    @State private var userName = ""
    @State private var email = ""
    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"),scale: 3)
        
        /*
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
           // Color.red
            ProgressView()
        }
        .frame(width: 200, height: 200)
        */
        
        /*
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            }else if phase.error != nil {
                Text("There was error loading the page")
            }else {
                ProgressView()
            }
        }
        .frame(width:200, height: 200)
         */
        
        Form {
            Section {
                TextField("Username", text: $userName)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("Creating account....")
                }
            }
            .disabled(isFormDisabled)
        }
    }
    
    var isFormDisabled: Bool {
        userName.count < 5 || email.count < 5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
