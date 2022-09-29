//
//  ServerStatusVM.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

final class ServerStatusVM: ObservableObject {
    
    enum State {
        case loading
        case error(message: String)
        case result(status: ServerStatus)
    }
    
    @Published var state: State = .loading
    
    init(service: ApexService) {
        self.service = service
        
        Task { await serverStatus() }
    }
    
    // MARK: Private
    
    private let service: ApexService
    
    @MainActor private func serverStatus() async {
        do {
            print(try await service.serverStatus())
            state = .result(status: try await service.serverStatus())
        } catch let error as HTTPError {
            state = .error(message: error.caption)
        } catch {
            state = .error(message: error.localizedDescription)
        }
    }
    
    static var mock: ServerStatusVM {
        let vm = ServerStatusVM(service: ApexService())
        vm.state = .result(status: ApexService().serverStatusMock)
        return vm
    }
}
