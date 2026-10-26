//
//  NetworkManager.swift
//  SecurityCompanion
//
//  Created by thinkpalm on 23/10/26.
//

import Foundation

// DTO for incoming API mock posts/events
public struct APIEventDTO: Codable, Identifiable {
    public let id: Int
    public let title: String
    public let body: String
}

public actor NetworkManager {
    public static let shared = NetworkManager()
    private init() {}
    
    public enum NetworkError: Error {
        case invalidURL
        case invalidResponse
        case decodingFailed
    }
    
    public func fetchSecurityEvents() async throws -> [APIEventDTO] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_limit=10") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let events = try JSONDecoder().decode([APIEventDTO].self, from: data)
            return events
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
