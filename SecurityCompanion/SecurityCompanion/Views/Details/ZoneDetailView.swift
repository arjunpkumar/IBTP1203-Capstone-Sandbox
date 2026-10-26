//
//  ZoneDetailView.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//

import SwiftUI
import SwiftData

public struct ZoneDetailView: View {
    @Bindable public var zone: SecurityZone
    
    public var body: some View {
        Form {
            Section(header: Text("Zone Status")) {
                HStack {
                    Label("Current State", systemImage: zone.iconName)
                    Spacer()
                    Toggle(zone.isArmed ? "Armed" : "Disarmed", isOn: $zone.isArmed)
                        .tint(.blue)
                }
                
                HStack {
                    Text("Sensor Condition")
                    Spacer()
                    Text(zone.sensorStatus)
                        .foregroundColor(zone.sensorStatus == "Secure" ? .green : .red)
                }
            }
            
            Section(header: Text("Hardware Diagnostics")) {
                HStack {
                    Text("Battery Level")
                    Spacer()
                    Text("\(zone.batteryLevel)%")
                        .foregroundColor(zone.batteryLevel > 20 ? .primary : .red)
                }
                
                HStack {
                    Text("Zone Identifier")
                    Spacer()
                    Text(zone.id.uuidString.prefix(8) + "...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Section {
                Button(action: {
                    zone.sensorStatus = zone.sensorStatus == "Secure" ? "Triggered" : "Secure"
                }) {
                    Text(zone.sensorStatus == "Secure" ? "Simulate Sensor Trigger" : "Reset Sensor Status")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle(zone.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
