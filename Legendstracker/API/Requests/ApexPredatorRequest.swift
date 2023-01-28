import Foundation

extension ApexService {

    /// This method will return the RP/AP needed to reach Apex Predator on PC, Playstation, Xbox and Switch.
    /// It will also return the number of Masters on each platform.
    func apexPredators() async throws -> ApexPredatorResponse {
        components.path = "/predator"

        do {
            let predator: ApexPredatorResponse = try await request(with: components.url)
            return predator
        } catch {
            throw error
        }
    }

    var apexPredator_Mock: ApexPredatorResponse {
        let r: ApexPredatorResponse = try! getMockData(forFileName: "Apexpredator_Mock", filetype: "json")
        return r
    }
}
