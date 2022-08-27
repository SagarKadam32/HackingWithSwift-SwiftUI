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
    
    init(filterKey: String, filterValue: String, predicate: String, @ViewBuilder content: @escaping(T) -> Content) {
        _fetchedRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: predicate, filterKey,filterValue))
        self.content = content
    }
}
