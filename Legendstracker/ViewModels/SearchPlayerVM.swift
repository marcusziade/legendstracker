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
        case empty
    }
    
    @Published var state: State = .empty
    @Published var searchQuery: String = ""
    
    init(service: ApexService) {
        self.service = service

        $searchQuery
            .dropFirst()
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
    
    private let service: ApexService
    
    @MainActor private func player() async {
        state = .loading
        do {
            debugPrint(try await service.player(forQuery: searchQuery))
            state = .result(player: try await service.player(forQuery: searchQuery))
        } catch let error as HTTPError {
            debugPrint(error.caption)
            state = .error(message: error.caption)
        } catch {
            debugPrint(error)
            state = .error(message: error.localizedDescription)
        }
    }
    
    static var mock: SearchPlayerVM {
        let vm = SearchPlayerVM(service: ApexService())
        vm.state = .result(player: ApexService().playerMock)
        return vm
    }
}
