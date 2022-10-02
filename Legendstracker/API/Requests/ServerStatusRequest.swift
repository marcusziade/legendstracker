import Foundation

extension ApexService {

    /// Get the Apex server status
    func serverStatus() async throws -> ServerStatus {
#if targetEnvironment(simulator)
        return serverStatusMock
#else
        components.path = "/servers"
        
        do {
            let status: ServerStatus = try await request(with: components.url)
            return status
        } catch {
            throw error
        }
#endif
    }

    var serverStatusMock: ServerStatus {
        let s: ServerStatus = try! getMockData(forFileName: "ServerStatusMock", filetype: "json")
        return s
    }
}
