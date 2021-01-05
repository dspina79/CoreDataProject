//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Dave Spina on 1/4/21.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContraintExampleView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
