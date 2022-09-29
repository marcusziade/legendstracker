//
//  CraftingRotationRequest.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

extension ApexService {
    
    /// Get the crafting rotation.
    func craftingRotation() async throws -> CraftingRotationResponse {
        components.path = "/crafting"
        
        do {
            let rotation: CraftingRotationResponse = try await request(with: components.url)
            return rotation
        } catch {
            throw error
        }
    }
}
