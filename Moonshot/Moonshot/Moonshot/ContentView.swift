//
//  ContentView.swift
//  Moonshot
//
//  Created by Sagar Kadam on 15/08/22.
//

import SwiftUI

struct MissionLink: View {
    var mission: Mission
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(.lightBackground))
    }
}

struct GridLayout: View {
    var astronauts: [String:Astronaut]
    var missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    MissionLink(mission: mission)
                }
            }
        }
        .padding([.horizontal,.bottom])
    }
}

struct ListLayout: View {
    var astronauts: [String:Astronaut]
    var missions: [Mission]

    var body: some View {
            VStack {
                List{
                    ForEach(missions) { mission in
                           NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                MissionLink(mission: mission)
                            }
                        }
                }
               .listStyle(.plain)
               .listRowBackground(Color.lightBackground)
            }
    }
}

struct ContentView: View {
    @State private var showingGrid = true
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    Group {
                        if showingGrid {
                            GridLayout(astronauts: astronauts, missions: missions)
                        }else {
                            ListLayout(astronauts: astronauts, missions: missions)
                                .frame(height: geometry.size.height)
                        }
                    }
                }
                .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
                .toolbar {
                    Button("Switch View") {
                        showingGrid.toggle()
                    }
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
