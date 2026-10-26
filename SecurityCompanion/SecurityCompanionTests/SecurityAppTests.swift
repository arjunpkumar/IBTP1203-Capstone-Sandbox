//
//  SecurityAppTests.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 26/10/26.
//
import XCTest
@testable import SecurityCompanion

final class SecurityAppTests: XCTestCase {

    func testZoneInitialArmState() {
        let zone = SecurityZone(name: "Test Garage", isArmed: true, batteryLevel: 90, sensorStatus: "Secure")
        XCTAssertTrue(zone.isArmed, "Zone should be initialized in an armed state.")
        XCTAssertEqual(zone.name, "Test Garage")
        XCTAssertEqual(zone.batteryLevel, 90)
    }

    func testZoneArmAndDisarmToggleLogic() {
        let zone = SecurityZone(name: "Front Perimeter", isArmed: true)
        
        // Disarm
        zone.isArmed = false
        XCTAssertFalse(zone.isArmed, "Zone should successfully disarm.")
        
        // Re-arm
        zone.isArmed = true
        XCTAssertTrue(zone.isArmed, "Zone should successfully re-arm.")
    }
    
    func testSensorStatusTriggerLogic() {
        let zone = SecurityZone(name: "Back Door", isArmed: true, sensorStatus: "Secure")
        zone.sensorStatus = "Triggered"
        XCTAssertEqual(zone.sensorStatus, "Triggered", "Sensor status should change to Triggered when breached.")
    }
}
