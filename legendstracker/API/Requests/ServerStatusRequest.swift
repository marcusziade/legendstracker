//
//  ServerStatusRequest.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

extension ApexService {
    
    /// Get the Apex server status
    func serverStatus() async throws -> ServerStatus {
        components.path = "/servers"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue)
        ]

        do {
            let status: ServerStatus = try await request(with: components.url)
            return status
        } catch {
            throw error
        }
    }
}
