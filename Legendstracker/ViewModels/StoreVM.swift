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
        
        var retries = 0
        while retries < 5 {
            do {
                state = .result(store: try await service.store())
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
    
    static var mock: StoreVM {
        let vm = StoreVM(service: ApexService())
        vm.state = .result(store: ApexService().storeMock)
        return vm
    }
}
