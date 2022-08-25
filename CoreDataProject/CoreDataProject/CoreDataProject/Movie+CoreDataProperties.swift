//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Sagar Kadam on 25/08/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var releaseYear: Int16
    
    public var wrappedTitle : String {
        return title ?? "Unknown Title"
    }

}

extension Movie : Identifiable {

}
