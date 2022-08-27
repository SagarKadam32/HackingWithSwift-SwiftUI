//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Sagar Kadam on 27/08/22.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchedRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchedRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, predicate: String, sortDescriptor: NSSortDescriptor, @ViewBuilder content: @escaping(T) -> Content) {
        
        _fetchedRequest = FetchRequest<T>(sortDescriptors: [sortDescriptor], predicate: NSPredicate(format: predicate, filterKey,filterValue))
        self.content = content
    }
}



// Ref - https://www.hackingwithswift.com/forums/100-days-of-swiftui/day-59-generic-filteredlist-in-core-data/8902
