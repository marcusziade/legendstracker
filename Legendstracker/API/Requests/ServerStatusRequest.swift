//
//  ServerStatusRequest.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

extension ApexService {
    
    /// Get the Apex server status
    func serverStatus() async throws -> ServerStatus {
        components.path = "/servers"

        do {
            let status: ServerStatus = try await request(with: components.url)
            return status
        } catch {
            throw error
        }
    }
    
    var serverStatusMock: ServerStatus {
        let s: ServerStatus = try! getMockData(forFileName: "ServerStatusMock", filetype: "json")
        return s
    }
}
