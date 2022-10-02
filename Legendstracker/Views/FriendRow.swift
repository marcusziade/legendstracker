//
//  FriendRow.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 2.10.2022.
//

import Kingfisher
import SwiftUI

struct FriendRow: View {

    let friend: ApexPlayer

    var body: some View {
        HStack(alignment: .center) {
            KFImage(URL(string: (friend.selectedLegend?.imgAssets.icon)!))
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            VStack(alignment: .leading, spacing: 8) {
                Text(friend.name)
                HStack(alignment: .lastTextBaseline) {
                    Label(friend.isInGame ? "In-game" : "Online", systemImage: friend.isInGame ? "gamecontroller.fill" : "person.circle.fill")
                    .foregroundColor(friend.isInGame ? .yellow : .blue)
                    HStack(alignment: .lastTextBaseline) {
                        Text(friend.currentState.capitalized)
                        if friend.currentStateSinceTimestamp != -1 {
                            Text(friend.currentStateSinceTimestampText)
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
            Spacer()
            VStack {
                KFImage(URL(string: (friend.brRank.rankImg)))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                KFImage(URL(string: (friend.arenaRank.rankImg)))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            }
        }
        .padding(.horizontal)
    }
}

struct FriendRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendRow(friend: ApexService().playerMock)
            .preferredColorScheme(.dark)
    }
}
