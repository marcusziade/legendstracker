import Foundation

extension ApexService {
    
    /// Get player UID for given name.
    func uid(for name: String) async throws -> PlayerUIDResponse {
        components.path = "/nametouid"
        
        do {
            let uid: PlayerUIDResponse = try await request(with: components.url)
            return uid
        } catch {
            throw error
        }
    }
}

