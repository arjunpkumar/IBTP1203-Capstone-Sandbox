//
//  SecurityEvent.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//
import Foundation
import SwiftData

@Model
public class SecurityEvent: Identifiable {
    public var id: UUID
    public var timestamp: Date
    public var message: String
    public var severity: String // "Info", "Warning", "Critical"
    
    public init(id: UUID = UUID(), timestamp: Date = Date(), message: String, severity: String = "Info") {
        self.id = id
        self.timestamp = timestamp
        self.message = message
        self.severity = severity
    }
}
