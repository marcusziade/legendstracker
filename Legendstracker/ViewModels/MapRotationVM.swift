import Foundation

final class MapRotationVM: ObservableObject {

    enum State {
        case loading
        case error(message: String)
        case result(map: MapRotationResponse, craftingComponents: CraftingResponse)
    }

    @Published var state: State = .loading

    init(
        service: ApexService
    ) {
        self.service = service

        Task { await mapRotation() }
    }

    // MARK: Private

    private let service: ApexService

    @MainActor private func mapRotation() async {
        state = .loading

        var retries = 0
        while retries < 5 {
            do {
                state = .result(
                    map: try await service.mapRotation(),
                    craftingComponents: try await service.craftingComponents()
                )
                break
            } catch let error as HTTPError {
                switch error {
                case .rateLimit:
                    // Delay next try with a second. The ratelimit is 2 requests / second.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        retries += 1
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
        let s = ApexService()
        vm.state = .result(map: s.mapRotation_Mock, craftingComponents: s.craftingRotation_Mock)
        return vm
    }
}
