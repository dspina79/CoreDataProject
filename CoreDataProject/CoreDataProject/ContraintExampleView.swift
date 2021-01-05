//
//  ContraintExampleView.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/4/21.
//

import SwiftUI
import CoreData

struct ContraintExampleView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
                Text("\(wizard.someValue)")
                    .font(.caption)
            }
            
            Button("Add") {
                let wiz = Wizard(context: self.moc)
                wiz.name = "Harry Potter"
                wiz.someValue = Int16.random(in: 0...100)
            }
            
            Button("Save") {
                moc.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
                do {
                    if self.moc.hasChanges {
                        try self.moc.save()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContraintExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ContraintExampleView()
    }
}
