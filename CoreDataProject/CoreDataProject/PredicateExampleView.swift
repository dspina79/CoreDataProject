//
//  PredicateExampleView.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/5/21.
//

import SwiftUI
import CoreData

struct PredicateExampleView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe BEGINSWITH %@", "Star")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                VStack {
                    Text(ship.name ?? "Unknown Name")
                    Text(ship.universe ?? "Universe Unknown")
                        .font(.caption)
                }
            }
            
            Button("Add Ships") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "USS Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: self.moc)
                ship2.name = "USS Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: self.moc)
                ship3.name = "Millenium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: self.moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                let ship5 = Ship(context: self.moc)
                ship5.name = "Firefly"
                ship5.universe = "Firefly"
                
                try? self.moc.save()
            }
        }
    }
}

struct PredicateExampleView_Previews: PreviewProvider {
    static var previews: some View {
        PredicateExampleView()
    }
}
