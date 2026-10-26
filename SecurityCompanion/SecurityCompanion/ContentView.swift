//
//  ContentView.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//

import SwiftUI
import SwiftData

public struct ContentView: View {
    @State private var isAuthenticated: Bool = false
    
    public var body: some View {
        Group {
            if isAuthenticated {
                MainTabView(isAuthenticated: $isAuthenticated)
            } else {
                LoginView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}

#Preview {
    ContentView()
}
