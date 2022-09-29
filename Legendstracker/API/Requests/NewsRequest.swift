//
//  NewsRequest.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//

import Foundation

extension ApexService {
    
    func news() async throws -> [NewsArticle] {
        do {
            let news: [NewsArticle] = try await request(with: newsURL)
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
    
    var newsMock: [NewsArticle] {
        let news: [NewsArticle] = try! getMockData(forFileName: "newsMock", filetype: "json")
        return news
    }
}
