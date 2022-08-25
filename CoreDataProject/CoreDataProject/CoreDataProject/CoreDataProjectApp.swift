//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Sagar Kadam on 25/08/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
