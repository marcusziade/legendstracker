//
//  SearchPlayerVM.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Combine
import Foundation

final class SearchPlayerVM: ObservableObject {
    
    enum State {
        case loading
        case error(message: String)
        case result(player: ApexPlayer)
    }
    
    @Published var state: State = .loading
    @Published var searchQuery: String = ""
    
    init(service: ApexService) {
        self.service = service
        
        Task { await player() }

        $searchQuery
            .dropFirst()
            .debounce(for: 0.4, scheduler: RunLoop.main)
            .sink { [unowned self] query in
                if !query.isEmpty {
                    Task { await refresh() }
                }
            }
            .store(in: &cancellables)
    }
    
    func refresh() async { await player() }
    
    // MARK: Private
    
    private var cancellables = Set<AnyCancellable>()
    
    private let service: ApexService
    
    @MainActor private func player() async {
        state = .loading
        do {
            state = .result(player: try await service.player(forName: searchQuery))
        } catch let error as HTTPError {
            state = .error(message: error.caption)
        } catch {
            state = .error(message: error.localizedDescription)
        }
    }
    
    static var mock: SearchPlayerVM {
        let vm = SearchPlayerVM(service: ApexService())
        vm.state = .result(player: ApexService().playerMock)
        return vm
    }
}
