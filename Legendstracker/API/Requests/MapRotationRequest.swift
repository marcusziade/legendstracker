//
//  MapRotationRequest.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

extension ApexService {
    
    /// Get the map rotation information.
    func mapRotation() async throws -> MapRotationResponse {
        components.path = "/maprotation"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue)
        ]
        
        do {
            let rotation: MapRotationResponse = try await request(with: components.url)
            return rotation
        } catch {
            throw error
        }
    }
}
