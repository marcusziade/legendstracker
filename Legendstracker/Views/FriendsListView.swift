//
//  FriendsListView.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 1.10.2022.
//

import Kingfisher
import SwiftUI

struct FriendsListView: View {

    @ObservedObject var model: FriendsVM

    var body: some View {
        NavigationView {
            switch model.state {
            case .loading:
                ProgressView()
                    // workaround for rate limit
                    .task { await model.reload() }

            case .error(message: let errorMessage):
                Color.black.opacity(0.5)
                Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                    .shadow(radius: 5).shadow(radius: 5)
                    .shadow(radius: 5).shadow(radius: 5)

            case .result(friends: let friends):
                Text(friends.first!.name)
//                VStack {
//                    ForEach(friends) { f in
//                        HStack {
//                            Text(f.name)
//                            KFImage(URL(string: f.brRank.rankImg))
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 35)
//                        }
//                    }
//                }

            case .empty:
                Text("Empty")
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView(model: FriendsVM.mock)
    }
}
