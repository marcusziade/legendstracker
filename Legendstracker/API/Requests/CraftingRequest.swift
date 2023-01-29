import Foundation

extension ApexService {

    /// This method will return the current items that can be crafted in replicators.
    func craftingComponents() async throws -> CraftingResponse {
        components.path = "/crafting"

        do {
            let rotation: CraftingResponse = try await request(with: components.url)
            return rotation
        } catch {
            throw error
        }
    }
    
    var craftingRotation_Mock: CraftingResponse {
        let r: CraftingResponse = try! getMockData(forFileName: "crafting_rotation_mock", filetype: "json")
        return r
    }
}
