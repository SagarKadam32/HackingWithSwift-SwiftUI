//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Sagar Kadam on 27/08/22.
//

import SwiftUI

struct FilteredList: View {
    @FetchRequest var fetchedRequest: FetchedResults<Singer>
    
    var body: some View {
        List(fetchedRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        _fetchedRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
