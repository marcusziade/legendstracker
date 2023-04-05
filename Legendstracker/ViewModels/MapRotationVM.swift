import Foundation

struct MapRotationResult {
    let map: MapRotationResponse
    let craftingComponents: CraftingResponse
}

final class MapRotationVM: Loadable {
    typealias ResultType = MapRotationResult
    typealias ServiceType = ApexService
    
    @Published var state: LoadableViewState<ResultType> = .loading
    
    var service: ServiceType
    
    init(service: ApexService) {
        self.service = service
        
        Task { await mapRotation() }
    }
    
    func refresh() async { await mapRotation() }
    
    // MARK: Private
    
    @MainActor private func mapRotation() async {
        await loadResult {
            let map = try await service.mapRotation()
            let craftingComponents = try await service.craftingComponents()
            return MapRotationResult(map: map, craftingComponents: craftingComponents)
        }
    }
    
    static var mock: MapRotationVM {
        let vm = MapRotationVM(service: ApexService())
        let s = ApexService()
        vm.state = .result(MapRotationResult(map: s.mapRotation_Mock, craftingComponents: s.craftingRotation_Mock))
        return vm
    }
}
