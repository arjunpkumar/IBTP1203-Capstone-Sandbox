//
//  MainTabView.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//
import SwiftUI

public struct MainTabView: View {
    @Binding public var isAuthenticated: Bool
    
    public var body: some View {
        TabView {
            // Tab 1: Security Zones
            ZoneListView()
                .tabItem {
                    Label("Zones", systemImage: "shield.fill")
                }
            
            // Tab 2: Live Event Feed
            EventFeedView()
                .tabItem {
                    Label("Events", systemImage: "list.bullet.rectangle.portrait")
                }
            
            // Tab 3: Settings
            SettingsView(isAuthenticated: $isAuthenticated)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}
