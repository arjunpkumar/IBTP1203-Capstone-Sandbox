//
//  ZoneListView.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//

import SwiftUI
import SwiftData

public struct ZoneListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var zones: [SecurityZone]
    
    public var body: some View {
        NavigationStack {
            List {
                ForEach(zones) { zone in
                    NavigationLink(destination: ZoneDetailView(zone: zone)) {
                        HStack(spacing: 16) {
                            Image(systemName: zone.iconName)
                                .font(.title2)
                                .foregroundColor(zone.isArmed ? .blue : .orange)
                                .frame(width: 32)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(zone.name)
                                    .font(.headline)
                                Text("Battery: \(zone.batteryLevel)% • Status: \(zone.sensorStatus)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Text(zone.isArmed ? "ARMED" : "DISARMED")
                                .font(.caption2)
                                .bold()
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(zone.isArmed ? Color.blue.opacity(0.15) : Color.orange.opacity(0.15))
                                .foregroundColor(zone.isArmed ? .blue : .orange)
                                .cornerRadius(6)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Security Zones")
            .onAppear {
                if zones.isEmpty {
                    seedDefaultZones()
                }
            }
        }
    }
    
    private func seedDefaultZones() {
        let defaultZones = [
            SecurityZone(name: "Front Door Entry", isArmed: true, batteryLevel: 92, sensorStatus: "Secure", iconName: "shield.fill"),
            SecurityZone(name: "Living Room Motion", isArmed: true, batteryLevel: 85, sensorStatus: "Secure", iconName: "eye.fill"),
            SecurityZone(name: "Backyard Perimeter", isArmed: false, batteryLevel: 74, sensorStatus: "Attention", iconName: "lock.shield.fill"),
            SecurityZone(name: "Garage Access", isArmed: true, batteryLevel: 98, sensorStatus: "Secure", iconName: "door.garage.closed")
        ]
        for zone in defaultZones {
            modelContext.insert(zone)
        }
    }
}
