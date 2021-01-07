//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/5/21.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        self.name ?? ""
    }

}

extension Candy : Identifiable {

}
