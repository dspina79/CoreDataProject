//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/4/21.
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
    @NSManaged public var year: Int16
    
    // may be better to leave the optionality but add wrapped computed properties
    
    public var wrappedTitle: String {
        return title ?? "Unknown Title"
    }
    
    public var wrappedDirector: String {
        return director ?? "Unknown"
    }

}

extension Movie : Identifiable {

}
