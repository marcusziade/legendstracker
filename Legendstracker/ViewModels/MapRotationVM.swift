import Foundation

final class MapRotationVM: ObservableObject {

    enum State {
        case loading
        case error(message: String)
        case result(rotation: MapRotationResponse)
    }

    @Published var state: State = .loading
    
    init(service: ApexService) {
        self.service = service
        
        Task { await reload() }
    }

    func reload() async { await mapRotation() }
    
    // MARK: Private

    private let service: ApexService

    @MainActor private func mapRotation() async {
        state = .loading

        var retries = 0
        while retries < 5 {
            do {
                state = .result(rotation: try await service.mapRotation())
                break
            } catch let error as HTTPError {
                switch error {
                case .rateLimit:
                    // Delay next try with a second. The ratelimit is 2 requests / second.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        retries += 1
                        debugPrint("ratelimit shit")
                    }
                default:
                    state = .error(message: error.caption)
                    break
                }
            } catch {
                state = .error(message: error.localizedDescription)
                break
            }
        }
    }

    static var mock: MapRotationVM {
        let vm = MapRotationVM(service: ApexService())
        vm.state = .result(rotation: ApexService().mapRotation_Mock)
        return vm
    }
}
