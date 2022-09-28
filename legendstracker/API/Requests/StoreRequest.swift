//
//  StoreRequest.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

extension ApexService {
    
    /// Get latest store items.
    func store() async throws -> [StoreProducts] {
        components.path = "/store"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue)
        ]
        
        do {
            let store: [StoreProducts] = try await request(with: components.url)
            return store
        } catch {
            throw error
        }
    }
}
