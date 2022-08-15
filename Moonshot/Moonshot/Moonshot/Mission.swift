//
//  Mission.swift
//  Moonshot
//
//  Created by Sagar Kadam on 15/08/22.
//

import Foundation

struct CrewRole: Codable {
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Appollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
}
