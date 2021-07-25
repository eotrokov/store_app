//
//  storeApp.swift
//  store
//
//  Created by e.otrokov on 25.07.2021.
//

import SwiftUI

@main
struct storeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabBarControl()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
