//
//  SecurityCompanionApp.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//

import SwiftUI
import SwiftData

@main
struct SecurityCompanionApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SecurityZone.self,
            SecurityEvent.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            // Seed default data if container is empty
            let context = ModelContext(container) 
            let descriptor = FetchDescriptor<SecurityZone>()
            let existingCount = try context.fetchCount(descriptor)
            
            if existingCount == 0 {
                let defaultZones = [
                    SecurityZone(name: "Front Door Entry", isArmed: true, batteryLevel: 92, sensorStatus: "Secure", iconName: "shield.fill"),
                    SecurityZone(name: "Living Room Motion", isArmed: true, batteryLevel: 85, sensorStatus: "Secure", iconName: "eye.fill"),
                    SecurityZone(name: "Backyard Perimeter", isArmed: false, batteryLevel: 74, sensorStatus: "Attention", iconName: "lock.shield.fill"),
                    SecurityZone(name: "Garage Access", isArmed: true, batteryLevel: 98, sensorStatus: "Secure", iconName: "door.garage.closed")
                ]
                for zone in defaultZones {
                    context.insert(zone)
                }
                try context.save()
            }
            
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
