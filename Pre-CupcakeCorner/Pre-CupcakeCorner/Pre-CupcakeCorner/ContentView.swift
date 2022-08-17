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
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
