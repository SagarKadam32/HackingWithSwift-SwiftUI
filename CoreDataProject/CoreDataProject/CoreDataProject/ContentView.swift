//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Sagar Kadam on 25/08/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    @FetchRequest(sortDescriptors: []) var ships: FetchedResults<Ship>
    
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == 'Star Wars'")) var starWarsUniverseShips: FetchedResults<Ship>
    
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e")) var shipNamesStartswithE: FetchedResults<Ship>
    
    @State private var lastNameFilter = "A"

    
    var body: some View {
        
        /* Ensuring Core Data objects are unique using constraints */
        /*
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    if moc.hasChanges {
                        try moc.save()
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        } */
        
        /* Filtering @FetchRequest using NSPredicate */
        /*
            VStack {
                Form {
                    Section("Original Data") {
                        List(ships, id:\.self) { ship in
                            VStack(alignment: .leading) {
                                Text(ship.name ?? "Unknown name")
                                Text(ship.universe ?? "TBD")
                            }
                        }
                    }
                    
                    Section("Star Wars Ships") {
                        List(starWarsUniverseShips, id:\.self) { ship in
                            VStack(alignment: .leading)  {
                                Text(ship.name ?? "Unknown name")
                                Text(ship.universe ?? "TBD")
                            }                        }
                    }
                    
                    Section("Ship Name with E") {
                        List(shipNamesStartswithE, id:\.self) { ship in
                            VStack(alignment: .leading) {
                                Text(ship.name ?? "Unknown name")
                                Text(ship.universe ?? "TBD")
                            }
                        }
                    }
                
                }
                
                Button("Add Examples") {
                    
                    let ship1 = Ship(context: moc)
                    ship1.name = "Enterprise"
                    ship1.universe = "Star Trek"
                    
                    let ship2 = Ship(context: moc)
                    ship2.name = "Defiant"
                    ship2.universe = "Star Trek"
                    
                    let ship3 = Ship(context: moc)
                    ship3.name = "Millennium Falcon"
                    ship3.universe = "Star Wars"
                    
                    let ship4 = Ship(context: moc)
                    ship4.name = "Executor"
                    ship4.universe = "Star Wars"
                    
                    if moc.hasChanges {
                        try? moc.save()
                    }
                }
            } */
        
        /* Dynamically filtering @FetchRequest with SwiftUI */
        
        VStack {
            FilteredList(filter: lastNameFilter)
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sherene"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                let sagar = Singer(context: moc)
                sagar.firstName = "Sagar"
                sagar.lastName = "Kadam "
                
                let kumar = Singer(context: moc)
                kumar.firstName = "Kumar"
                kumar.lastName = "Sanu"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
