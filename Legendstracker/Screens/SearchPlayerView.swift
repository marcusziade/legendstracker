//
//  SearchPlayerView.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Kingfisher
import SwiftUI

struct SearchPlayerView: View {
    
    @ObservedObject var model: SearchPlayerVM
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                switch model.state {
                case .loading:
                    ProgressView()

                case .error(message: let errorMessage):
                    Label(errorMessage, systemImage: "exclamationmark.triangle.fill")

                case .result(player: let p):
                    Text(p.selectedLegendName)
                    KFImage(URL(string: p.brRank.rankImg))

                case .empty:
                    Text("No search query...")
                }

                Spacer()
            }
        }
        .searchable(text: $model.searchQuery)
    }
}

struct SearchPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlayerView(model: SearchPlayerVM.mock)
            .preferredColorScheme(.dark)
    }
}
