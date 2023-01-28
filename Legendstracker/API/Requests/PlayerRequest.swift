import Foundation

extension ApexService {

    /// Makes a query for a player name or player UID
    /// - Parameter query: The input query from the user
    /// - Returns: An `ApexPlayer` object
    func player(forQuery query: String) async throws -> ApexPlayer {
        let decimalCharacters = CharacterSet.decimalDigits

        if query.rangeOfCharacter(from: decimalCharacters) == nil {
            return try await player(forName: query)
        }

        return try await player(forID: query)
    }

    /// To obtain a `Player` for name.
    private func player(forName name: String) async throws -> ApexPlayer {
        components.path = "/bridge"
        components.queryItems?
            .append(contentsOf: [
                URLQueryItem(name: "player", value: name),
                URLQueryItem(name: "platform", value: "PC"),
            ])

        do {
            let player: ApexPlayer = try await request(with: components.url)
            return player
        } catch {
            throw error
        }
    }

    /// To obtain a `Player` for id.
    private func player(forID id: String) async throws -> ApexPlayer {
        components.path = "/bridge"
        components.queryItems = [
            URLQueryItem(name: "auth", value: Keys.apiKey.rawValue),
            URLQueryItem(name: "uid", value: id),
            URLQueryItem(name: "platform", value: "PC"),
        ]

        do {
            let player: ApexPlayer = try await request(with: components.url)
            return player
        } catch {
            throw error
        }
    }

    var playerMock: ApexPlayer {
        let p: ApexPlayer = try! getMockData(forFileName: "ApexPlayerMock", filetype: "json")
        return p
    }
}
