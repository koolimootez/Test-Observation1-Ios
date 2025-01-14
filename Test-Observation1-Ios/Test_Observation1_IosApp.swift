//
//  Test_Observation1_IosApp.swift
//  Test-Observation1-Ios
//
//  Created by KOOLI MOOTEZ on 14/01/2025.
//

import SwiftUI

@main
struct Test_Observation1_IosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            juiceDrink()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
