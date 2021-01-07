//
//  CounrtyView.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/5/21.
//

import SwiftUI
import CoreData

struct CounrtyView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(header: Text(country.wrappedFullName)) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add") {
                self.moc.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
                let candy1 = Candy(context: self.moc)
                candy1.name = "Twix"
                candy1.origin = Country(context: moc)
                candy1.origin?.fullName = "United Kingdom"
                candy1.origin?.shortName = "UK"
                
                let candy2 = Candy(context: self.moc)
                candy2.name = "Mars"
                candy2.origin = Country(context: moc)
                candy2.origin?.fullName = "United Kingdom"
                candy2.origin?.shortName = "UK"
                
                let candy3 = Candy(context: self.moc)
                candy3.name = "Snickers"
                candy3.origin = Country(context: moc)
                candy3.origin?.fullName = "United States"
                candy3.origin?.shortName = "US"
                
                let candy4 = Candy(context: self.moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.fullName = "Switzerland"
                candy1.origin?.shortName = "CH"
                
                let candy5 = Candy(context: self.moc)
                candy5.name = "Kinder Eggs"
                candy5.origin = Country(context: moc)
                candy5.origin?.fullName = "Germany"
                candy5.origin?.shortName = "DE"
                
                let candy6 = Candy(context: self.moc)
                candy6.name = "Mr. Goodbar"
                candy6.origin = Country(context: moc)
                candy6.origin?.fullName = "United States"
                candy6.origin?.shortName = "US"
                
                try? self.moc.save()
            }
        }
    }
}

struct CounrtyView_Previews: PreviewProvider {
    static var previews: some View {
        CounrtyView()
    }
}
