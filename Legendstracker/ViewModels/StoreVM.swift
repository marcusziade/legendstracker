import Foundation

final class StoreVM: Loadable {
    typealias ResultType = [StoreProduct]
    typealias ServiceType = ApexService
    
    @Published var state: LoadableViewState<ResultType> = .loading
    
    var service: ServiceType
    
    init(service: ApexService) {
        self.service = service
        
        Task { await storeProducts() }
    }
    
    func refresh() async { await storeProducts() }
    
    // MARK: Private
    
    @MainActor private func storeProducts() async {
        await loadResult(service.store)
    }
    
    static var mock: StoreVM {
        let vm = StoreVM(service: ApexService())
        vm.state = .result(ApexService().storeMock)
        return vm
    }
}
