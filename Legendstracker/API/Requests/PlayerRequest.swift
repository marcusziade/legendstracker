//
//  PlayerRequest.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

extension ApexService {
    
    /// To obtain a `Player` for name.
    func player(forName name: String) async throws -> ApexPlayer {
        components.path = "/bridge"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue),
            URLQueryItem(name: "player", value: "Guitaripod"),
            URLQueryItem(name: "platform", value: "pc"),
        ]

        do {
            let player: ApexPlayer = try await request(with: components.url)
            return player
        } catch {
            throw error
        }
    }
    
    /// To obtain a `Player` for id.
    func player(forID id: String) async throws -> ApexPlayer {
        components.path = "/bridge"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue),
            URLQueryItem(name: "uid", value: "2297593921"),
            URLQueryItem(name: "platform", value: "pc"),
        ]

        do {
            let player: ApexPlayer = try await request(with: components.url)
            return player
        } catch {
            throw error
        }
    }
}
