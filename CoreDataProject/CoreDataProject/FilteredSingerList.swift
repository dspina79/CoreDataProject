//
//  FilteredSingerList.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/5/21.
//

import SwiftUI
import CoreData

struct FilteredSingerList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

