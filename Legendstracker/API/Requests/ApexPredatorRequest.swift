//
//  ApexPredatorRequest.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

extension ApexService {
    
    /// Get the latest Apex predators.
    func apexPredators() async throws -> ApexPredatorResponse {
        components.path = "/predator"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue)
        ]
        
        do {
            let predator: ApexPredatorResponse = try await request(with: components.url)
            return predator
        } catch {
            throw error
        }
    }
}
