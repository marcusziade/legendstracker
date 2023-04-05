import Foundation

final class ServerStatusVM: Loadable {
        
    typealias ResultType = ServerStatus
    typealias ServiceType = ApexService

    @Published var state: LoadableViewState<ServerStatus> = .loading
    var service: ApexService

    init(
        service: ApexService
    ) {
        self.service = service

        Task { await serverStatus() }
    }

    func refresh() async { await serverStatus() }

    // MARK: Private

    @MainActor private func serverStatus() async {
        await loadResult(service.serverStatus)
    }

    static var mock: ServerStatusVM {
        let vm = ServerStatusVM(service: ApexService())
        vm.state = .result(ApexService().serverStatusMock)
        return vm
    }
}
