//
//  FriendsStore.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 2.10.2022.
//

import Foundation

struct FriendsStore {

    /// Accounts: Viss, Guitaripod, Holiwhirl
    var friendIds: [String] = ["1007838066601", "2297593921", "1000542933771"]

    init() {

    }

    static var mock: FriendsStore {
        let ids: [String] = ["1007838066601", "2297593921", "1000542933771"]
        var vm = FriendsStore()
        vm.friendIds = ids
        return vm
    }
}
