import Combine
import Foundation

final class SearchPlayerVM: Loadable {
    typealias ResultType = ApexPlayer
    typealias ServiceType = ApexService

    @Published var searchQuery: String = "Guitaripod"
    @Published var showPredatorsView = false
    @Published var state: LoadableViewState<ResultType> = .empty
    
    var service: ServiceType

    init(
        service: ApexService
    ) {
        self.service = service

        $searchQuery
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map { query -> Bool in
                return query.isEmpty
            }
            .sink { [unowned self] isQueryEmpty in
                if isQueryEmpty {
                    state = .empty
                } else {
                    Task { await refresh() }
                }
            }
            .store(in: &cancellables)
    }

    func refresh() async { await player() }

    // MARK: Private

    private var cancellables = Set<AnyCancellable>()

    @MainActor private func player() async {
        await loadResult { try await service.player(forQuery: searchQuery)}
    }

    static var mock: SearchPlayerVM {
        let vm = SearchPlayerVM(service: ApexService())
        vm.state = .result(ApexService().playerMock)
        return vm
    }
}
