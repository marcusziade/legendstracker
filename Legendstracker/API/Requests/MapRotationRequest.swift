import Foundation

extension ApexService {
    
    /// Get the map rotation information.
    func mapRotation() async throws -> MapRotationResponse {
        components.path = "/maprotation"
        
        do {
            let rotation: MapRotationResponse = try await request(with: components.url)
            return rotation
        } catch {
            throw error
        }
    }
    
    var mapRotation_Mock: MapRotationResponse {
        let r: MapRotationResponse = try! getMockData(forFileName: "MapRotationResponse_Mock", filetype: "json")
        return r
    }
}

