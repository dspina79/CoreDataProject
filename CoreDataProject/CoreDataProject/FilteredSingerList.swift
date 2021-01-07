//
//  FilteredSingerList.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/5/21.
//

import SwiftUI
import CoreData

enum PredicateValues {
    case beginsWith(String)
    case contains(String)
    case endsWith(String)
}

struct FilteredSingerList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, predicateValueKey: PredicateValues, sorted: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        var predicateValue: String = ""
        var filterValue: String = ""
        
        switch predicateValueKey {
        case .beginsWith(let with):
            predicateValue = "BEGINSWITH"
            filterValue = with
        case .contains(let with):
            predicateValue = "CONTAINS"
            filterValue = with
        case .endsWith(let with):
            predicateValue = "ENDSWITH"
            filterValue = with
        default:
            predicateValue = "CONTAINS"
            filterValue = ""
        }
        
        
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sorted, predicate: NSPredicate(format: "%K \(predicateValue)[c] %@", filterKey, filterValue))
        self.content = content
    }
}

