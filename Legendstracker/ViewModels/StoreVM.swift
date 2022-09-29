//
//  StoreVM.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation

final class StoreVM: ObservableObject {
    
    enum State {
        case loading
        case error(message: String)
        case result(store: [StoreProduct])
    }

    @Published var state: State = .loading
    
    init(service: ApexService) {
        self.service = service
        
        Task { await storeProducts() }
    }
    
    func refresh() async { await storeProducts() }
    
    // MARK: Private
    
    private let service: ApexService
    
    @MainActor private func storeProducts() async {
        state = .loading
        do {
            state = .result(store: try await service.store())
        } catch let error as HTTPError {
            state = .error(message: error.caption)
        } catch {
            state = .error(message: error.localizedDescription)
        }
    }
    
    static var mock: StoreVM {
        let vm = StoreVM(service: ApexService())
        vm.state = .result(store: ApexService().storeMock)
        return vm
    }
}
