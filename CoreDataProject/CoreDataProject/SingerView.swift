//
//  SingerView.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/5/21.
//

import SwiftUI

struct SingerView: View {
    @Environment(\.managedObjectContext) var moc
    @State var filterValue = "A"
    @State private var newFirstName: String = ""
    @State private var newLastName: String = ""

    let sortValues: [NSSortDescriptor]  = [NSSortDescriptor(key: "lastName", ascending: true)]
    var body: some View {
        VStack {
            FilteredSingerList(filterKey: "lastName", filterValue: filterValue, sorted: sortValues) {
                (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Form {
                Section {
                    TextField("First Name", text: $newFirstName)
                    TextField("Last Name", text: $newLastName)
                }
                Section {
                    Button("Add New Person") {
                        let newSinger = Singer(context: moc)
                        newSinger.firstName = newFirstName
                        newSinger.lastName = newLastName
                        
                        if self.moc.hasChanges {
                            try? self.moc.save()
                            newFirstName = ""
                            newLastName = ""
                        }
                    }
                }
            }
            
            Button("Add Data") {
                let singer1 = Singer(context: self.moc)
                singer1.firstName = "Freddie"
                singer1.lastName = "Mercury"
                
                let singer2 = Singer(context: self.moc)
                singer2.firstName = "Aretha"
                singer2.lastName = "Franklin"
                
                let singer3 = Singer(context: self.moc)
                singer3.firstName = "Sam"
                singer3.lastName = "Cooke"
                
                try? self.moc.save()
            }
            
            Button("Set F") {
                self.filterValue = "F"
            }
            
            Button("Set M") {
                self.filterValue = "M"
            }
        }
    }
}

struct SingerView_Previews: PreviewProvider {
    static var previews: some View {
        SingerView()
    }
}
