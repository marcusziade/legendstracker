import Combine
import Foundation

final class SearchPlayerVM: ObservableObject {

    enum State {
        case loading
        case error(message: String)
        case result(player: ApexPlayer)
        case idle
    }
    
    @Published var state: State = .loading
    @Published var searchQuery: String = "Guitaripod"
    
    init(service: ApexService) {
        self.service = service

        $searchQuery
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map { query -> Bool in
                return query.isEmpty
            }
            .sink { [unowned self] isQueryEmpty in
                if isQueryEmpty {
                    state = .idle
                } else {
                    Task { await reload() }
                }
            }
            .store(in: &cancellables)
    }

    func reload() async { await player() }

    // MARK: Private

    private var cancellables = Set<AnyCancellable>()

    private let service: ApexService

    @MainActor private func player() async {
        state = .loading

        var retries = 0
        while retries < 5 {
            do {
                state = .result(player: try await service.player(forQuery: searchQuery))
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

    static var mock: SearchPlayerVM {
        let vm = SearchPlayerVM(service: ApexService())
        vm.state = .result(player: ApexService().playerMock)
        return vm
    }
}
