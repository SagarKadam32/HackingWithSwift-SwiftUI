//
//  Pre_BookwormApp.swift
//  Pre-Bookworm
//
//  Created by Sagar Kadam on 23/08/22.
//

import SwiftUI

@main
struct Pre_BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
