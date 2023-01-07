//
//  KaalayzApp.swift
//  Shared
//
//  Created by Shrish Deshpande on 1/7/23.
//

import SwiftUI

@main
struct KaalayzApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
