//
//  ContentView.swift
//  Pre-HotProspects
//
//  Created by Sagar Kadam on 04/09/22.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

@MainActor class User: ObservableObject {
    @Published var name = "Sagar Kadam"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    @StateObject private var user = User()
    @State private var selectedTab = "One"
    @StateObject var updater = DelayedUpdater()
    @State private var output1 = ""
    @State private var output2 = ""

    
    var body: some View {
        /* Reading custom values from the environment with @EnvironmentObject */
        /*
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
        .padding()
         */
        
        /* Creating tabs with TabView and tabItem() */
        /*
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .tabItem{
                    Label("One", systemImage: "star")
                }
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tag("One")
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .onTapGesture {
                    selectedTab = "One"
                }
                .tag("Two")
        } */
        
        /* Manually publishing ObservableObject changes */
        /* Text("Value is: \(updater.value)") */
        
        /* Understanding Swift’s Result type */
        Text(output1)
            .task {
                await fetchReadings()
            }
        
        Text(output2)
            .task {
                await fetchTaskReadings()
            }
    }
    
    func fetchReadings() async {
        do {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            output1 = "Found \(readings.count) readings"
        } catch {
            print("Download error")
        }
    }
    
    func fetchTaskReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        let result = await fetchTask.result
        
        /*
        do {
            output2 = try result.get()
        }catch {
            output2 = "Error: \(error.localizedDescription)"
        }*/
        
        switch result {
        case .success(let str):
            output2 = str
        case .failure(let error):
            output2 = "Error: \(error.localizedDescription)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
