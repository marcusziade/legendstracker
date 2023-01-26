import Foundation

extension ApexService {
    
    /// Get the latest Apex predators.
    func apexPredators() async throws -> ApexPredatorResponse {
        components.path = "/predator"
        
        do {
            let predator: ApexPredatorResponse = try await request(with: components.url)
            return predator
        } catch {
            throw error
        }
    }
}

