//
//  LoginView.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//

import SwiftUI

public struct LoginView: View {
    @Binding public var isAuthenticated: Bool
    
    @State private var username: String = "admin"
    @State private var password: String = ""
    @State private var errorMessage: String? = nil
    
    public var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            // App Branding Icon
            Image(systemName: "shield.checkered")
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            VStack(spacing: 8) {
                Text("Security Companion")
                    .font(.largeTitle)
                    .bold()
                Text("Enterprise Security Monitoring")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            VStack(spacing: 16) {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .font(.caption)
                        .foregroundColor(.red)
                }
                
                Button(action: handleLogin) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 32)
            
            Spacer()
            
            Text("Tip: Tap Log In with any credentials")
                .font(.caption2)
                .foregroundColor(.secondary)
                .padding(.bottom, 16)
        }
    }
    
    private func handleLogin() {
        if username.isEmpty || password.isEmpty {
            errorMessage = "Please enter both username and password."
        } else {
            errorMessage = nil
            withAnimation {
                isAuthenticated = true
            }
        }
    }
}
