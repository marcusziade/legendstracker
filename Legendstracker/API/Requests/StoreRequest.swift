import Foundation

extension ApexService {

    /// Get latest store items.
    func store() async throws -> [StoreProduct] {
        components.path = "/store"

        do {
            let store: [StoreProduct] = try await request(with: components.url)
            return store
        } catch {
            throw error
        }
    }

    var storeMock: [StoreProduct] {
        let s: [StoreProduct] = try! getMockData(forFileName: "StoreMock", filetype: "json")
        return s
    }
}
