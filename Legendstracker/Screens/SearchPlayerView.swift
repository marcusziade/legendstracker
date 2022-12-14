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
            VStack {
                switch model.state {
                case .loading:
                    ZStack {
                        PlayerGlobalInfoView(player: ApexService().playerMock)
                            .redacted(reason: .placeholder)
                        VStack { ProgressView(); Spacer() }
                    }

                case .error(message: let errorMessage):
                    ZStack {
                        PlayerGlobalInfoView(player: ApexService().playerMock)
                            .redacted(reason: .placeholder)
                        Color.black.opacity(0.5)
                        Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                            .shadow(radius: 5).shadow(radius: 5)
                            .shadow(radius: 5).shadow(radius: 5)
                    }

                case .result(player: let p):
                    PlayerGlobalInfoView(player: p)

                case .empty:
                    Text("No search query").fontWeight(.black)
                    PlayerGlobalInfoView(player: ApexService().playerMock)
                        .redacted(reason: .placeholder)
                }
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
