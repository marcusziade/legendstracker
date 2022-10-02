import Foundation

extension ApexService {

    /// Get latest store items.
    func store() async throws -> [StoreProduct] {
#if targetEnvironment(simulator)
        return storeMock
#else
        components.path = "/store"

        do {
            let store: [StoreProduct] = try await request(with: components.url)
            return store
        } catch {
            throw error
        }
#endif
    }

    var storeMock: [StoreProduct] {
        let s: [StoreProduct] = try! getMockData(forFileName: "StoreMock", filetype: "json")
        return s
    }
}
