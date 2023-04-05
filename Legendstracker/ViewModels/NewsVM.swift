import Foundation

final class NewsVM: Loadable {
    typealias ResultType = [NewsArticle]
    typealias ServiceType = ApexService
    
    @Published var state: LoadableViewState<ResultType> = .loading
    @Published var showSafari = false
    
    var service: ServiceType
    
    init(service: ApexService) {
        self.service = service
        
        Task { await news() }
    }
    
    func refresh() async { await news() }
    
    // MARK: Private
    
    @MainActor private func news() async {
        await loadResult(service.news)
    }
    
    static var mock: NewsVM {
        let vm = NewsVM(service: ApexService())
        vm.state = .result(ApexService().newsMock)
        return vm
    }
}
