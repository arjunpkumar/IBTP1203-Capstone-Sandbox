//
//  SecurityZone.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//

import Foundation
import SwiftData

@Model
public class SecurityZone: Identifiable {
    public var id: UUID
    public var name: String
    public var isArmed: Bool
    public var batteryLevel: Int // e.g., 0 - 100
    public var sensorStatus: String // "Secure", "Triggered", "Offline"
    public var iconName: String // SF Symbol name
    
    public init(id: UUID = UUID(), name: String, isArmed: Bool = true, batteryLevel: Int = 100, sensorStatus: String = "Secure", iconName: String = "shield.fill") {
        self.id = id
        self.name = name
        self.isArmed = isArmed
        self.batteryLevel = batteryLevel
        self.sensorStatus = sensorStatus
        self.iconName = iconName
    }
}
