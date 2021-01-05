//
//  ConditionalManagedSave.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/4/21.
//

import SwiftUI

struct ConditionalManagedSave: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            // check for pending changes to avoid performance impact unnecessarily
            if moc.hasChanges {
                try? self.moc.save()
            }
        }
    }
}

struct ConditionalManagedSave_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalManagedSave()
    }
}
