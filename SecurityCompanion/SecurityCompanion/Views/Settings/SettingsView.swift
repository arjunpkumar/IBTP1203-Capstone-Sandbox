//
//  SettingsView.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//
import SwiftUI

public struct SettingsView: View {
    @Binding public var isAuthenticated: Bool
    
    @AppStorage("pushNotificationsEnabled") private var pushNotificationsEnabled: Bool = true
    @AppStorage("sirenAlertSound") private var sirenAlertSound: Bool = true
    @State private var showingLogoutConfirmation: Bool = false
    
    public var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Security Preferences")) {
                    Toggle("Push Notifications", isOn: $pushNotificationsEnabled)
                        .tint(.blue)
                    Toggle("Audible Siren Alerts", isOn: $sirenAlertSound)
                        .tint(.blue)
                }
                
                Section(header: Text("System Information")) {
                    HStack {
                        Text("App Version")
                        Spacer()
                        Text("1.0.0 (Build 104)")
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Protocol Status")
                        Spacer()
                        Text("Encrypted (TLS 1.3)")
                            .foregroundColor(.green)
                    }
                }
                
                Section {
                    Button(role: .destructive, action: {
                        showingLogoutConfirmation = true
                    }) {
                        HStack {
                            Spacer()
                            Text("Log Out")
                                .bold()
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .confirmationDialog("Are you sure you want to log out?", isPresented: $showingLogoutConfirmation, titleVisibility: .visible) {
                Button("Log Out", role: .destructive) {
                    withAnimation {
                        isAuthenticated = false
                    }
                }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
}
