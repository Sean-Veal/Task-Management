//
//  TaskManagementApp.swift
//  TaskManagement
//
//  Created by Sean Veal on 7/17/23.
//

import SwiftUI

@main
struct TaskManagementApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
