//
//  UIDForPlayerNameRequest.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

extension ApexService {
    
    /// Get player UID for given name.
    func uid(for name: String) async throws -> PlayerUIDResponse {
        components.path = "/nametouid"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue)
        ]
        
        do {
            let uid: PlayerUIDResponse = try await request(with: components.url)
            return uid
        } catch {
            throw error
        }
    }
}
