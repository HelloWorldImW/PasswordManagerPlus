//
//  PasswordManagerPlusApp.swift
//  PasswordManagerPlus
//
//  Created by Joe on 2020/9/29.
//

import SwiftUI

@main
struct PasswordManagerPlusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
