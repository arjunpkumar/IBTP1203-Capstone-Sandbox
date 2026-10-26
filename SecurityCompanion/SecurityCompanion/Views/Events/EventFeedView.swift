//
//  EventFeedView.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//
import SwiftUI

public struct EventFeedView: View {
    @State private var events: [APIEventDTO] = []
    @State private var isLoading: Bool = false
    @State private var errorMessage: String? = nil
    
    public var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Fetching security alerts...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let errorMessage = errorMessage {
                    VStack(spacing: 12) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        Text(errorMessage)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        Button("Retry") {
                            Task { await loadEvents() }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(events) { event in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text("Alert #\(event.id)")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.blue)
                                Spacer()
                                Text("Live Feed")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            Text(event.title.capitalized)
                                .font(.headline)
                            Text(event.body)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                        }
                        .padding(.vertical, 4)
                    }
                    .refreshable {
                        await loadEvents()
                    }
                }
            }
            .navigationTitle("Live Event Feed")
            .task {
                await loadEvents()
            }
        }
    }
    
    private func loadEvents() async {
        isLoading = true
        errorMessage = nil
        
        do {
            events = try await NetworkManager.shared.fetchSecurityEvents()
            isLoading = false
        } catch {
            errorMessage = "Failed to load live security events. Please check your connection."
            isLoading = false
        }
    }
}
