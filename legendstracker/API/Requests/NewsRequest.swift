//
//  NewsRequest.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//

import Foundation

extension ApexService {
    
    func news() async throws -> [News] {
        do {
            let news: [News] = try await request(with: newsURL)
            return news
        } catch {
            throw error
        }
    }
    
    /// To obtain a list of news articles
    private var newsURL: URL? {
        components.path = "/news"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue)
        ]
        return components.url
    }
}
