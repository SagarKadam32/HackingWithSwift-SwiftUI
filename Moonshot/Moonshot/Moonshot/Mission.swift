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
    let launchData: String?
    let crew: [CrewRole]
    let description: String
}
