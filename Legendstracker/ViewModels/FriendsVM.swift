//
//  FriendsVM.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 1.10.2022.
//

import Foundation

final class FriendsVM: ObservableObject {

    enum State {
        case loading
        case error(message: String)
        case result(friends: [ApexPlayer])
        case empty
    }

    @Published var state: State = .empty

    init(
        service: ApexService,
        friendsStore: FriendsStore
    ) {
        self.service = service
        self.friendsStore = friendsStore

        Task { await reload() }
    }

    func reload() async { await friends() }

    // MARK: Private

    private let service: ApexService
    private let friendsStore: FriendsStore

    @MainActor private func friends() async {
        state = .loading
        #if DEBUG || targetEnvironment(simulator)
        state = .result(friends: ApexService().playerMocks)
        #else
        do {
            var friends: [ApexPlayer] = []
            for id in friendsStore.friendIds {
                friends.append(try await service.player(forQuery: id))
            }
            debugPrint(friends.count)
            state = .result(friends: friends)
        } catch let error as HTTPError {
            debugPrint(error.caption)
            state = .error(message: error.caption)
        } catch {
            debugPrint(error)
            state = .error(message: error.localizedDescription)
        }
        #endif
    }

    static var mock: FriendsVM {
        let vm = FriendsVM(service: ApexService(), friendsStore: FriendsStore())
        vm.state = .result(friends: ApexService().playerMocks)
        return vm
    }
}
