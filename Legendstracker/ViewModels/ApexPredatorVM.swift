import Foundation

final class ApexPredatorVM: Loadable {
    typealias ResultType = ApexPredatorResponse
    typealias ServiceType = ApexService
    
    @Published var state: LoadableViewState<ResultType> = .loading
    
    var service: ServiceType
    
    init(service: ApexService) {
        self.service = service
        
        Task { await predators() }
    }
    
    func refresh() async { await predators() }
    
    // MARK: Private
    
    @MainActor private func predators() async {
        await loadResult(service.apexPredators)
    }
    
    static var mock: ApexPredatorVM {
        let vm = ApexPredatorVM(service: ApexService())
        vm.state = .result(ApexService().apexPredator_Mock)
        return vm
    }
}
