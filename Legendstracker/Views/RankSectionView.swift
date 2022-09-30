//
//  RankSectionView.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 1.10.2022.
//

import Kingfisher
import SwiftUI

struct RankSectionView: View {

    let score: Int
    let rankName: String
    let rankDivision: Int
    let seasonTitle: String
    let thumbnail: URL

    var body: some View {
        HStack {
            KFImage(thumbnail)
                .resizable()
                .scaledToFit()
                .frame(height: 100)

            VStack(alignment: .leading) {
                Text("Score: \(score)")
                Text("\(rankName) \(rankDivision)")
                Text(seasonTitle)
            }
        }
    }
}

struct RankSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let p = ApexService().playerMock
        RankSectionView(score: p.brRank.rankScore, rankName: p.brRank.rankName, rankDivision: p.brRank.rankDiv, seasonTitle: p.rankedBrSeasonTitle, thumbnail: URL(string: p.brRank.rankImg)!)
    }
}
