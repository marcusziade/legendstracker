//
//  StoreRequest.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

extension ApexService {
    
    /// Get latest store items.
    func store() async throws -> [StoreProduct] {
        components.path = "/store"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue)
        ]
        
        do {
            let store: [StoreProduct] = try await request(with: components.url)
            return store
        } catch {
            throw error
        }
    }
    
    var storeMock: [StoreProduct] {
        let s: [StoreProduct] = try! getMockData(forFileName: "StoreMock", filetype: "json")
        return s
    }
}
