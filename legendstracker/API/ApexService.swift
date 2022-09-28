//
//  ApexService.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//

import Foundation

/// https://apexlegendsapi.com/#introduction
final class ApexService {
    
    var components: URLComponents = {
        var c = URLComponents()
        c.scheme = "https"
        c.host = "api.mozambiquehe.re"
        return c
    }()
    
    /// Make a request to the F1 API and return the chosen `Codable` type.
    /// - Parameter url: Pass in a predefined URL.
    /// - Returns: A decoded type that conforms to Codable.
    func request<T: Codable>(with url: URL?) async throws -> T {
        guard let url = url else {
            throw HTTPError.url
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.response
        }
        
        switch httpResponse.statusCode {
            
        case 200...299:
            do {
                return try jsonDecoder.decode(T.self, from: data)
            } catch {
                throw error
            }
            
        case 400: throw HTTPError.retry
        case 403: throw HTTPError.unauthorized
        case 404: throw HTTPError.response
        case 405: throw HTTPError.external
        case 410: throw HTTPError.platform
        case 429: throw HTTPError.rateLimit
        case 500: throw HTTPError.server
        default: throw HTTPError.unknown
        }
    }
    
    // MARK: Private
    
    private let jsonDecoder: JSONDecoder = {
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        return d
    }()
}
