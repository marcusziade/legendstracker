import Foundation

final class ApexPredatorVM: ObservableObject {

    enum State {
        case loading
        case result(predators: ApexPredatorResponse)
        case error(message: String)
    }

    @Published var state: State = .loading

    init(
        service: ApexService
    ) {
        self.service = service

        Task { await predators() }
    }

    func refresh() async { await predators() }

    // MARK: Private

    private let service: ApexService

    @MainActor private func predators() async {
        state = .loading

        var retries = 0
        while retries < 5 {
            do {
                state = try await .result(predators: service.apexPredators())
                break
            } catch let error as HTTPError {
                switch error {
                case .rateLimit:
                    // Delay next try with a second. The ratelimit is 2 requests / second.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
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

    static var mock: ApexPredatorVM {
        let vm = ApexPredatorVM(service: ApexService())
        vm.state = .result(predators: ApexService().apexPredator_Mock)
        return vm
    }
}
